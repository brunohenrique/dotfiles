return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      sorting_strategy = 'ascending',
      layout_config = { prompt_position = 'top' },
      set_env = { ['COLORTERM'] = 'truecolor' },
      color_devicons = false,
      file_ignore_patterns = { 'vendor', 'node_modules' },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--column",
        "--hidden",
        "--line-number",
        "--no-heading",
        "--smart-case",
        "--trim",
        "--with-filename",
      }
    },
  },
  keys = {
    { "<Leader>ca", '<CMD>lua require("telescope.builtin").lsp_code_actions()<CR>',            desc = "[LSP] Code Actions", remap = false },
    { "<Leader>di", '<CMD>lua require("telescope.builtin").diagnostics()<CR>',                 desc = "Diagnostics",        remap = false },
    { "<Leader>fb", '<CMD>lua require("telescope.builtin").buffers()<CR>',                     desc = "Find Buffers",       remap = false },
    { "<Leader>fd", '<CMD>lua require("user.telescope").dotfiles()<CR>',                       desc = "Find Dotfiles",      remap = false },
    { "<Leader>ff", '<CMD>lua require("telescope.builtin").find_files({ hidden = true })<CR>', desc = "Find Files",         remap = false },
    { "<Leader>fg", '<CMD>lua require("telescope.builtin").live_grep()<CR>',                   desc = "Live Grep",          remap = false },
    { "<Leader>fn", '<CMD>lua require("telescope.builtin").help_tags()<CR>',                   desc = "Find Help Tags",     remap = false },
  }
}
