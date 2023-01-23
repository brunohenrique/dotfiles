local M = {}

i_mappings = {
  ['<C-C>'] = { '<Esc>', 'Esc' },
  ['<C-K>'] = { '<CMD>lua require("luasnip").expand_or_jump()<CR>', 'Expand Snippet' },
  ['<C-E>'] = { '<Plug>luasnip-next-choice', 'Snippet Loop Options' },
  ['<C-S>'] = { '<CMD>lua require("luasnip.extras.select_choice")()<CR>', 'Snippet Select Options' },
}

s_mappings = {
  ['<C-K>'] = { '<CMD>lua require("luasnip").expand_or_jump()<CR>', 'Expand Snippet' },
  ['<C-E>'] = { '<Plug>luasnip-next-choice', 'Snippet Loop Options' },
  ['<C-S>'] = { '<CMD>lua require("luasnip.extras.select_choice")()<CR>', 'Snippet Select Options' },
}

n_mappings = {
  ['<Left>'] = { '<CMD>echoe "Use h"<CR>', 'Use h' },
  ['<Right>'] = { '<CMD>echoe "Use l"<CR>', 'Use l' },
  ['<Up>'] = { '<CMD>echoe "Use k"<CR>', 'Use k' },
  ['<Down>'] = { '<CMD>echoe "Use j"<CR>', 'Use j' },
  ['<Leader>'] = {
    f = {
      name = '+find',
      f = { '<CMD>lua require("telescope.builtin").find_files({ hidden = true })<CR>', 'Find Files' },
      d = { '<CMD>lua require("user.telescope").dotfiles()<CR>', 'Find Dotfiles' },
      g = { '<CMD>lua require("telescope.builtin").live_grep()<CR>', 'Live Grep' },
      b = { '<CMD>lua require("telescope.builtin").buffers()<CR>', 'Find Buffers' },
      n = { '<CMD>lua require("telescope.builtin").help_tags()<CR>', 'Find Help Tags' },
    },
    c = { a = { '<CMD>lua require("telescope.builtin").lsp_code_actions()<CR>', '[LSP] Code Actions' } },
    d = { i = { '<CMD>lua require("telescope.builtin").diagnostics()<CR>', 'Diagnostics' } },
    s = { b = { '<CMD>SymbolsOutline<CR>', 'LSP Symbols' } },
  },
  g = {
    name = '+lsp',
    D = { '<CMD>lua vim.lsp.buf.declaration()<CR>', 'Go to Declaration' },
    d = { '<CMD>lua vim.lsp.buf.definition()<CR>', 'Go to Definition' },
    i = { '<CMD>lua vim.lsp.buf.implementation()<CR>', 'Go to Implementation' },
    r = { '<CMD>lua vim.lsp.buf.references()<CR>', 'References' },
  },
  ['<space>'] = {
    name = '+lsp',
    w = {
      name = '+lsp',
      a = { '<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Workspace Folder' },
      r = { '<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder' },
      l = { '<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'Inspect Workspace Folder' },
    },
    e = { '<CMD>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', 'Diagnostics' },
    K = { '<CMD>lua vim.lsp.buf.hover()<CR>', 'Hover Information' },
    f = { '<CMD>lua vim.lsp.buf.format({async = true})<CR>', 'Code Formating' },
    q = { '<CMD>lua vim.lsp.diagnostic.setloclist()<CR>', 'Set Loclist' },
    D = { '<CMD>lua vim.lsp.buf.type_definition()<CR>', 'Type Definition' },
    c = {
      a = { '<CMD>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
      t = { '<CMD>ColorizerToggle<CR>', 'Colorizer Toggle' },
    },
    d = {
      name = '+diagnostics',
      e = { '<CMD>lua vim.diagnostic.enable()<CR>', 'Enable Diagnostics' },
      d = { '<CMD>lua vim.diagnostic.disable()<CR>', 'Disable Diagnostics' },
    },
    r = { n = { '<CMD>lua vim.lsp.buf.rename()<CR>', 'Rename' } },
  },
  ['<C-K>'] = { '<CMD>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
  ['<C-S>f'] = { ':CtrlSF<SPACE>', 'Signature Help' },
  [']d'] = { '<CMD>lua vim.diagnostic.goto_next({ float =  { border = "single" }})<CR>', 'Next Diagnostics' },
  ['[d'] = { '<CMD>lua vim.diagnostic.goto_prev({ float =  { border = "single" }})<CR>', 'Previus Diagnostics' },
}

local wk = require('which-key')
function M.setup()
  local normal_mode = { mode = 'n', noremap = true, silent = true }
  -- local visual_mode = { mode = 'v', noremap = true, silent = true }
  local insert_mode = { mode = 'i', noremap = true, silent = true }
  local select_mode = { mode = 's', noremap = true, silent = true }

  wk.register(i_mappings, insert_mode)
  wk.register(s_mappings, select_mode)
  wk.register(n_mappings, normal_mode)
end

return M
