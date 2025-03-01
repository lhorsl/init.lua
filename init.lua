-- ----------------- [[ Setting Options]] --------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Where splits occur
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- ------------------------[[ Keymaps ]]---------------------------

require 'lhorsl.remap'

-- ----------------------[[ Autocommands ]] ----------------------

require 'lhorsl.autocommands'

-- ----------------------[[ Configure and install plugins ]] ----------------------

require('lazy').setup({
  -- Primary must haves
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'ThePrimeagen/vim-be-good',
  require 'lhorsl.plugins.which-key',
  require 'lhorsl.plugins.treesitter',
  require 'lhorsl.plugins.telescope',
  require 'lhorsl.plugins.lsp',
  require 'lhorsl.plugins.autoformat',
  require 'lhorsl.plugins.autocompletion',

  -- Nice to haves
  require 'lhorsl.plugins.todo-comments',
  require 'lhorsl.plugins.mini',
  -- TODO: see what of these i actually want
  require 'lhorsl.plugins.debug',
  --  require 'lhorsl.plugins.lint',
  require 'lhorsl.plugins.neo-tree',
  require 'lhorsl.plugins.autopairs',
  -- require 'lhorsl.plugins.gitsigns',

  -- Colourscheme
  {

    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
