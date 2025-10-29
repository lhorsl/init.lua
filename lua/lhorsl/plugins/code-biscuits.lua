return {
  'code-biscuits/nvim-biscuits',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    cursor_line_only = true,
    default_config = {
      max_length = 12, -- Max length of biscuit text
      prefix_string = ' >> ',
    },
  },
}
