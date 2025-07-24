local M = {}

--  get visual selection
function M.get_visual_selection()
  local saved_reg = vim.fn.getreg 'v'

  vim.cmd 'normal! "vy'

  local selection = vim.fn.getreg 'v'

  vim.fn.setreg('v', saved_reg)

  return selection
end

--  Find selection and replace across project
function M.find_and_replace_visual()
  local search_term = M.get_visual_selection()

  if not search_term or search_term == '' then
    vim.notify('No text selected', vim.log.levels.ERROR)
    return
  end

  -- Clean up the search term (remove newlines for multi-line selections)
  search_term = search_term:gsub('\n', ' '):gsub('^%s+', ''):gsub('%s+$', '')

  vim.g.find_replace_search = search_term

  vim.notify('Press <C-q> to send results to quickfix', vim.log.levels.INFO)

  -- Use Telescope to find all occurrences
  require('telescope.builtin').live_grep {
    default_text = search_term,
    attach_mappings = function(prompt_bufnr, map)
      local actions = require 'telescope.actions'

      -- Map <C-q> to send to quickfix and then prompt for replacement
      map('i', '<C-q>', function()
        actions.smart_send_to_qflist(prompt_bufnr)
        actions.open_qflist(prompt_bufnr)
        vim.schedule(function()
          M.perform_replacement()
        end)
      end)

      map('n', '<C-q>', function()
        actions.smart_send_to_qflist(prompt_bufnr)
        actions.open_qflist(prompt_bufnr)
        vim.schedule(function()
          M.perform_replacement()
        end)
      end)

      return true
    end,
  }
end

--  perform the actual replacement
function M.perform_replacement()
  local search = vim.g.find_replace_search
  if not search then
    vim.notify('No search term found', vim.log.levels.ERROR)
    return
  end

  local qf_list = vim.fn.getqflist()
  if #qf_list == 0 then
    vim.notify('No matches found in quickfix list', vim.log.levels.WARN)
    return
  end

  vim.notify(string.format("Found %d occurrences of '%s'", #qf_list, search), vim.log.levels.INFO)

  vim.ui.input({
    prompt = string.format("Replace '%s' with: ", search),
  }, function(replacement)
    if not replacement then
      vim.notify('Replacement cancelled', vim.log.levels.INFO)
      return
    end

    -- Escape special characters for vim regex
    local escaped_search = vim.fn.escape(search, '/\\.*$^~[]')
    local escaped_replacement = vim.fn.escape(replacement, '/\\&')

    local save_cursor = vim.fn.getpos '.'

    -- Perform the replacement on all files in quickfix list
    local success, error_msg = pcall(function()
      vim.cmd(string.format('cdo s/\\V%s/%s/g | update', escaped_search, escaped_replacement))
    end)

    vim.fn.setpos('.', save_cursor)

    if success then
      vim.notify(string.format("Successfully replaced '%s' with '%s' in %d locations", search, replacement, #qf_list), vim.log.levels.INFO)
      vim.cmd 'cclose'
    else
      vim.notify(string.format('Error during replacement: %s', error_msg), vim.log.levels.ERROR)
    end
  end)
end

-- Set up keybindings
function M.setup()
  -- Main keybinding: visual mode find and replace with telescope preview
  vim.keymap.set('v', '<leader>fr', function()
    -- Get selection while still in visual mode
    M.find_and_replace_visual()
  end, { desc = 'Find and replace selection (with preview)' })

  -- Optional: normal mode version that uses word under cursor
  vim.keymap.set('n', '<leader>fr', function()
    -- Select word under cursor
    vim.cmd 'normal! viw'
    -- Now in visual mode, call the function
    M.find_and_replace_visual()
  end, { desc = 'Find and replace word under cursor' })

  -- Direct replacement without preview (original immediate function)
  vim.keymap.set('v', '<leader>fa', function()
    M.find_and_replace_visual_immediate()
  end, { desc = 'Find and replace all (no preview)' })
end

-- Keep the immediate replacement function for direct replacement
function M.find_and_replace_visual_immediate()
  -- Get visual selection
  local search_term = M.get_visual_selection()

  if not search_term or search_term == '' then
    vim.notify('No text selected', vim.log.levels.ERROR)
    return
  end

  -- Clean up the search term
  search_term = search_term:gsub('\n', ' '):gsub('^%s+', ''):gsub('%s+$', '')

  -- Prompt for replacement immediately
  vim.ui.input({
    prompt = string.format("Replace '%s' with: ", search_term),
  }, function(replacement)
    if not replacement then
      return
    end

    -- Escape special characters
    local escaped_search = vim.fn.escape(search_term, '/\\.*$^~[]')
    local escaped_replacement = vim.fn.escape(replacement, '/\\&')

    -- Use vimgrep to find all occurrences
    local success, _ = pcall(function()
      vim.cmd(string.format('vimgrep /\\V%s/gj **/*', escaped_search))
    end)

    if not success then
      vim.notify('No matches found', vim.log.levels.WARN)
      return
    end

    -- Get the quickfix list to show count
    local qf_list = vim.fn.getqflist()

    -- Perform replacement
    vim.cmd(string.format('cdo s/\\V%s/%s/g | update', escaped_search, escaped_replacement))

    vim.notify(string.format("Replaced '%s' with '%s' in %d locations", search_term, replacement, #qf_list), vim.log.levels.INFO)
  end)
end

-- Optional: normal mode version that uses word under cursor
vim.keymap.set('n', '<leader>fr', function()
  -- Select word under cursor
  vim.cmd 'normal! viw'
  vim.cmd 'normal! '
  M.find_and_replace_visual()
end, { desc = 'Find and replace word under cursor' })

return M
