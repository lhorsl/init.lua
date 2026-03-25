return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 'go', 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'python', 'json', 'yaml' },
    auto_install = true,
    highlight = {
      enable = true,
      -- Disable treesitter for large files to prevent lag (>5000 lines or >512KB)
      disable = function(_, buf)
        local max_filesize = 512 * 1024
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
        return vim.api.nvim_buf_line_count(buf) > 5000
      end,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
}
