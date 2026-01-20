return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  config = function()
    require("silicon").setup({
      theme = "nord",
    })
  end,
}
