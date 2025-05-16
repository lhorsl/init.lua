return {
  'rcarriga/nvim-notify',
  lazy = false,
  priority = 1000,
  config = function()
    local notify = require 'notify'

    notify.setup {
      -- Default animation style
      stages = 'fade',

      -- Default timeout for notifications (in milliseconds)
      timeout = 5000,

      -- Default icons (uses Nerd Font icons)
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
    }

    -- Replace the default vim.notify with nvim-notify
    vim.notify = notify
  end,
}
