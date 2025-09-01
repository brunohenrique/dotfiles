return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufWinEnter",
  opts = {
    options = { theme = "nord" },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = {
        {
          "filename",
          path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = {
            "nvim_lsp",
            "nvim_workspace_diagnostic",
            "nvim_diagnostic",
          },
          symbols = {
            error = "  ",
            warn = "  ",
            info = "  ",
            hint = "󰌵 ",
          },
        },
        "encoding",
        "fileformat",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = {
        {
          "tabs",
          mode = 2,
          path = 1,
          tabs_color = {
            -- Same values as the general color option can be used here.
            active = "lualine_a_insert", -- Color for active tab.
            inactive = "lualine_a_normal", -- Color for inactive tab.
          },
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "buffers" },
    },
  },
}
