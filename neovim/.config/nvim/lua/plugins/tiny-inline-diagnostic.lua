return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = false,
  event = "LspAttach", -- Or `LspAttach`
  priority = 1001, -- needs to be loaded in first
  opts = {
    options = {
      virt_texts = {
        priority = 10000,
      },
    },
  },
  -- config = function()
  --   require("tiny-inline-diagnostic").setup()
  -- end,
}
