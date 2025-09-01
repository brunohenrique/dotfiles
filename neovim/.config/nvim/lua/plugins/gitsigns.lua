return {
  "lewis6991/gitsigns.nvim",
  event = "BufWinEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
    },
    current_line_blame_formatter_opts = { relative_time = false },
  },
}
