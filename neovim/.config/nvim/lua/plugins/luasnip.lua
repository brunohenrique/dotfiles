return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  keys = {
    {
      "<C-K>",
      '<CMD>lua require("luasnip").expand_or_jump()<CR>',
      desc = "Expand Snippet",
      remap = false,
      mode = "i",
    },
    {
      "<C-K>",
      '<CMD>lua require("luasnip").expand_or_jump()<CR>',
      desc = "Expand Snippet",
      remap = false,
      mode = "s",
    },
    {
      "<C-E>",
      "<Plug>luasnip-next-choice",
      desc = "Snippet Loop Options",
      remap = false,
      mode = "i",
    },
    {
      "<C-E>",
      "<Plug>luasnip-next-choice",
      desc = "Snippet Loop Options",
      remap = false,
      mode = "s",
    },
    {
      "<C-S>",
      '<CMD>lua require("luasnip.extras.select_choice")()<CR>',
      desc = "Snippet Select Options",
      remap = false,
      mode = "i",
    },
    {
      "<C-S>",
      '<CMD>lua require("luasnip.extras.select_choice")()<CR>',
      desc = "Snippet Select Options",
      remap = false,
      mode = "s",
    },
  },
  config = function()
    require("luasnip.loaders.from_lua").load({})
  end,
}
