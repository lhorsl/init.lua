return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: open menu' })
    vim.keymap.set('n', '<C-y>', function() harpoon:list():add() end, { desc = 'Harpoon: add file' })

    vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon: select 1' })
    vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon: select 2' })
    vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon: select 3' })

    vim.keymap.set('n', '<C-S-H>', function() harpoon:list():prev() end, { desc = 'Harpoon: prev' })
    vim.keymap.set('n', '<C-S-L>', function() harpoon:list():next() end, { desc = 'Harpoon: next' })
  end,
}
