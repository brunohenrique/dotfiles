return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "quarto", "gitcommit", "Avante" },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  opts = {
        file_types = { "markdown", "quarto", "gitcommit", "Avante" },
    heading = {
      sign = false,
      position = 'inline',
      backgrounds = {
        "RenderMarkdownHint",
        "RenderMarkdownHint",
        "RenderMarkdownHint",
        "RenderMarkdownHint",
        "RenderMarkdownHint",
        "RenderMarkdownHint",
      },
      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH1",
        "RenderMarkdownH1",
        "RenderMarkdownH1",
        "RenderMarkdownH1",
        "RenderMarkdownH1",
      },
    },
  },
  -- config = function()
  --   require("render-markdown").setup({})
  -- end,
  -- name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
}
