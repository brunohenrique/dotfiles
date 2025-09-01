local M = {}

local keymaps = {
  {
    mode = { "i" },
  },

  {
    mode = { "s" },
  },

  { "<C-S>f",    ":CtrlSF<SPACE>",                                                                   desc = "Signature Help",           remap = false },
  { "<Down>",    '<CMD>echoe "Use j"<CR>',                                                           desc = "Use j",                    remap = false },
  { "<Left>",    '<CMD>echoe "Use h"<CR>',                                                           desc = "Use h",                    remap = false },
  { "<Right>",   '<CMD>echoe "Use l"<CR>',                                                           desc = "Use l",                    remap = false },
  { "<Up>",      '<CMD>echoe "Use k"<CR>',                                                           desc = "Use k",                    remap = false },
  { "<space>ct", "<CMD>ColorizerToggle<CR>",                                                         desc = "Colorizer Toggle",         remap = false },
  { "<space>dd", "<CMD>lua vim.diagnostic.enable(false)<CR>",                                        desc = "Disable Diagnostics",      remap = false },
  { "<space>de", "<CMD>lua vim.diagnostic.enable(true)<CR>",                                         desc = "Enable Diagnostics",       remap = false },
  { "<space>e",  '<CMD>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', desc = "Diagnostics",              remap = false },
  { "<space>wl", "<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",            desc = "Inspect Workspace Folder", remap = false },
  { "[d",        '<CMD>lua vim.diagnostic.goto_prev({ float = { border = "single" }})<CR>',          desc = "Previus Diagnostics",      remap = false },
  { "]d",        '<CMD>lua vim.diagnostic.goto_next({ float = { border = "single" }})<CR>',          desc = "Next Diagnostics",         remap = false },
}

local wk = require('which-key')
function M.setup()
  -- local normal_mode = { mode = 'n', noremap = true, silent = true }
  wk.add(keymaps)
end

return M
