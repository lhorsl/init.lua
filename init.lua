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
local undodir = vim.fn.expand '~/.local/share/nvim/undodir'
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
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
  'github/copilot.vim', -- Copilot
  require 'lhorsl.plugins.which-key', -- Which key binding helper
  require 'lhorsl.plugins.treesitter', -- Improve syntax highlighting and code understanding
  require 'lhorsl.plugins.telescope', -- Fuzzy finder for files, buffers, etc.
  require 'lhorsl.plugins.lsp', -- Language server protocol support (including completion & format)
  require 'lhorsl.plugins.autoformat',
  require 'lhorsl.plugins.autocompletion',
  require 'lhorsl.plugins.autopairs', -- Automatically close brackets, quotes, etc.
  require 'lhorsl.plugins.comment', -- Commenting support
  require 'lhorsl.plugins.gitsigns', -- Git change indicators in the sign column
  require 'lhorsl.plugins.render-markdown', -- Render markdown files
  require 'lhorsl.plugins.code-biscuits',

  -- Nice to haves
  'ThePrimeagen/vim-be-good',
  require 'lhorsl.plugins.todo-comments', -- Highlight TODO comments
  require 'lhorsl.plugins.nvim-notify', -- Notifications
  require 'lhorsl.plugins.startup', -- Startup screen

  -- Colourscheme
  {

    'morhetz/gruvbox',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
      vim.g.gruvbox_contrast_dark = 'soft'
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
