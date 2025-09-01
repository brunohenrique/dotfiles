return {
  'eero-lehtinen/oklch-color-picker.nvim',
  config = function()
    require('oklch-color-picker').setup {}
    -- One handed keymaps recommended, you will be using the mouse
    vim.keymap.set('n', '<leader>v', function()
      require('oklch-color-picker').pick_under_cursor()
    end, { desc = 'Color pick under cursor' })
  end,
}
