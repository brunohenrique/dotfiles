return {
  "Wansmer/treesj",
  keys = {
    { "<space>t", "<CMD>lua require('treesj').toggle()<CR>", desc = "[TreeSJ] Split/Join Toggle", remap = false },
    { "<space>s", "<CMD>lua require('treesj').split()<CR>", desc = "[TreeSJ] Split", remap = false },
    { "<space>j", "<CMD>lua require('treesj').join()<CR>", desc = "[TreeSJ] Join", remap = false },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
}
