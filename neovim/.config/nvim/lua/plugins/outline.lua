return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>to", "<CMD>Outline<CR>", desc = "Toggle Outline" },
  },
  opts = {
    -- Your setup opts here
  },
}
