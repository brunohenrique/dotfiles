return {
  "SergioRibera/codeshot.nvim",
  keys = {
    { "<Leader>css", ":SSSelected<CR>", { mode = "v", remap = false }, desc = "CodeShot Selected" },
    { "<Leader>csf", ":SSFocused<CR>", { mode = "v", remap = false }, desc = "CodeShot Focused" },
  },
  config = function()
    require("codeshot").setup({})
  end,
}
