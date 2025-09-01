return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional
  },
  opts = {
    preset = "modern",
    plugins = {
      spelling = {
        enabled = true,
        suggestions = 20
      }
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    }
  }
}
