return {
  'startup-nvim/startup.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
  config = function()
    vim.api.nvim_set_hl(0, 'StartupHeader', { fg = '#ebbcba' })
    require('startup').setup {
      header = {
        type = 'text',
        align = 'center',
        fold_section = false,
        title = 'Header',
        margin = 5,
        content = {
          [[    ██▓     ██░ ██  ▒█████   ██▀███    ██████  ██▓       ]],
          [[   ▓██▒    ▓██░ ██▒▒██▒  ██▒▓██ ▒ ██▒▒██    ▒ ▓██▒       ]],
          [[   ▒██░    ▒██▀▀██░▒██░  ██▒▓██ ░▄█ ▒░ ▓██▄   ▒██░       ]],
          [[   ▒██░    ░▓█ ░██ ▒██   ██░▒██▀▀█▄    ▒   ██▒▒██░       ]],
          [[   ░██████▒░▓█▒░██▓░ ████▓▒░░██▓ ▒██▒▒██████▒▒░██████▒   ]],
          [[   ░ ▒░▓  ░ ▒ ░░▒░▒░ ▒░▒░▒░ ░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░░ ▒░▓  ░   ]],
          [[   ░ ░ ▒  ░ ▒ ░▒░ ░  ░ ▒ ▒░   ░▒ ░ ▒░░ ░▒  ░ ░░ ░ ▒  ░   ]],
          [[     ░ ░    ░  ░░ ░░ ░ ░ ▒    ░░   ░ ░  ░  ░    ░ ░      ]],
          [[       ░  ░ ░  ░  ░    ░ ░     ░           ░      ░  ░   ]],
          [[                                                         ]],
        },
        highlight = 'StartupHeader',
        default_color = '',
      },
      -- Body section with mappings
      body = {
        type = 'mapping',
        align = 'center',
        fold_section = false,
        title = 'Basic Commands',
        margin = 5,
        content = {
          { ' Find File', 'Telescope find_files', '<leader>ff' },
          { ' Recent Files', 'Telescope oldfiles', '<leader>fo' },
          { ' File Browser', 'Telescope file_browser', '<leader>fb' },
          { ' New File', "lua require'startup'.new_file()", '<leader>nf' },
        },
        highlight = 'String',
        default_color = '',
      },
      footer = {
        type = 'text',
        align = 'center',
        fold_section = false,
        title = 'Footer',
        margin = 5,
        content = { '$$ code == money $$' },
        highlight = 'Number',
        default_color = '',
      },
      options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 20, 3, 3, 0 },
      },
      mappings = {
        execute_command = '<CR>',
        open_file = 'o',
        open_file_split = '<c-o>',
        open_section = '<TAB>',
        open_help = '?',
      },
      colors = {
        background = '#1f2227',
        folded_section = '#56b6c2',
      },
      parts = { 'header', 'body', 'footer' },
    }
  end,
}
