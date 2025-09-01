return {
  "Aaronik/GPTModels.nvim",
  keys = {
    { "<leader>a", "<CMD>GPTModelsCode<CR>", { mode = "x", remap = false } },
    { "<leader>a", "<CMD>GPTModelsCode<CR>", { mode = "a", remap = false } },
    { "<leader>c", "<CMD>GPTModelsChat<CR>", { mode = "x", remap = false } },
    { "<leader>c", "<CMD>GPTModelsChat<CR>", { mode = "a", remap = false } },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
