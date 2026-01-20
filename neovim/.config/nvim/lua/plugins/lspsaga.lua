return {
  enabled = false,
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  keys = {
    { "<leader>ic", "<CMD>Lspsaga incoming_calls<CR>", desc = "[LSP] Call Hierarchy (incoming)", remap = false },
    { "<leader>oc", "<CMD>Lspsaga outgoing_calls<CR>", desc = "[LSP] Call Hierarchy (outgoing)", remap = false },
    { "<space>ca", "<CMD>Lspsaga code_action<CR>", desc = "[LSP] Code Action", remap = false },
    { "<leader>pd", "<CMD>Lspsaga peek_definition<CR>", desc = "[LSP] Peek Definition", remap = false },
    { "<leader>ptd", "<CMD>Lspsaga peek_type_definition<CR>", desc = "[LSP] Peek Type Definition", remap = false },
    { "gd", "<CMD>Lspsaga goto_definition<CR>", desc = "[LSP] Go To Definition", remap = false },
    { "<space>D", "<CMD>Lspsaga goto_type_definition<CR>", desc = "[LSP] Go To Definitionype Definition", remap = false },
    { "<leader>fl", "<CMD>Lspsaga finder<CR>", desc = "[LSP] Finder (def+ref+imp)", remap = false },
    { "<space>K", "<CMD>Lspsaga hover_doc<CR>", desc = "[LSP] Hover Docs", remap = false },
    { "<space>rn", "<CMD>Lspsaga rename<CR>", desc = "[LSP] Rename", remap = false },
  },
  opts = {
    lightbulb = {
      virtual_text = false,
    },
    symbol_in_winbar = {
      show_file = false,
    },
    ui = {
      code_action = '󰌵',
      kind = {},
    },
  },
  config = function(_, opts)
    require("lspsaga").setup(opts)
    require("user.lsp_settings").setup()
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
