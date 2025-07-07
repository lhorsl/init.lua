return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = '*', -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- add any opts here
    -- for example
    auto_suggestions_provider = 'claude',
  },
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
  config = function()
    local opts = {
      provider = 'claude',
    }
    opts.claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-sonnet-4-20250514',
      temperature = 0,
      max_tokens = 64000,
    }
    -- Load system prompt from file
    local prompt_file = vim.fn.stdpath 'config' .. '/lua/lhorsl/prompts/system_prompt.md'
    local f = io.open(prompt_file, 'r')
    local system_prompt = nil
    if f then
      system_prompt = f:read '*all'
      f:close()
      opts.system_prompt = system_prompt
    else
      vim.notify('Could not load system prompt file', vim.log.levels.WARN)
      opts.system_prompt = ''
    end
    opts.auto_suggestions_provider = 'claude'
    require('avante').setup(opts)
  end,
}
