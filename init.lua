----------------- [[ Setting Options]] --------------------
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

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Configure persistent undo directory
local undodir = vim.fn.expand('~/.local/share/nvim/undodir')
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50

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
  'github/copilot.vim',
  'ThePrimeagen/vim-be-good',
  'eandrju/cellular-automaton.nvim',
  require 'lhorsl.plugins.which-key',
  require 'lhorsl.plugins.treesitter',
  require 'lhorsl.plugins.telescope',
  require 'lhorsl.plugins.lsp',
  require 'lhorsl.plugins.autoformat',
  require 'lhorsl.plugins.autocompletion',

  -- Nice to haves
  require 'lhorsl.plugins.todo-comments',
  require 'lhorsl.plugins.mini',
  require 'lhorsl.plugins.debug',
  require 'lhorsl.plugins.autopairs',
  require 'lhorsl.plugins.gitsigns',
  require 'lhorsl.plugins.avante',
  require 'lhorsl.plugins.comment',
  require 'lhorsl.plugins.undotree',

  -- Colourscheme
  {

    'rose-pine/neovim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'rose-pine-moon'
    end,
  },
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
}, {
  ui = {
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
