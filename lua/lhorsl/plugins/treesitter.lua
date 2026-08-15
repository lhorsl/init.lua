local ENSURE_INSTALLED = {
  'bash',
  'c',
  'diff',
  'go',
  'html',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'vim',
  'vimdoc',
  'yaml',
}

local MAX_FILESIZE = 512 * 1024
local MAX_LINES = 5000

-- Skip treesitter on large files to prevent lag
local function is_large_file(buf)
  local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > MAX_FILESIZE then
    return true
  end
  return vim.api.nvim_buf_line_count(buf) > MAX_LINES
end

return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(ENSURE_INSTALLED)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('lhorsl-treesitter', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang or not vim.treesitter.language.add(lang) or is_large_file(args.buf) then
          return
        end

        vim.treesitter.start(args.buf, lang)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
