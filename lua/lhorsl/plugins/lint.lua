return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters.golangci_lint = {
        cmd = 'golangci-lint',
        args = { 'run', '--out-format', 'json' },
        stdin = false,
        append_fname = true,
        stream = 'stdout',
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics = {}
          if output == '' then
            return diagnostics
          end

          local decoded = vim.json.decode(output)
          if not decoded or not decoded.Issues then
            return diagnostics
          end

          for _, issue in ipairs(decoded.Issues) do
            local message = issue.Text
            local lnum = issue.Pos.Line - 1
            local col = issue.Pos.Column - 1
            local end_lnum = issue.Pos.Line - 1
            local end_col = col + 1

            if issue.SourceLines and #issue.SourceLines > 0 then
              end_col = col + #issue.SourceLines[1]
            end

            table.insert(diagnostics, {
              source = issue.FromLinter,
              lnum = lnum,
              col = col,
              end_lnum = end_lnum,
              end_col = end_col,
              severity = vim.diagnostic.severity.ERROR,
              message = message,
            })
          end

          return diagnostics
        end,
      }

      lint.linters_by_ft = {
        markdown = { 'vale' },
        go = { 'golangci-lint' },
        json = { 'jsonlint' },
        python = { 'ruff' },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
