local protocol = require('vim.lsp.protocol')

local M = {}

M.setup = function()
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#completion-kinds
  protocol.CompletionItemKind = {
    '[  Text]',
    '[󰊕  Method]',
    '[󰡱  Function]',
    '[󰙴  Constructor]',
    '[  Field]',
    '[󰫧  Variable]',
    '[  Class]',
    '[󰹑  Interface]',
    '[󰕳 Module]',
    '[  Property]',
    '[  Unit]',
    '[󱢏  Value]',
    '[  Enum]',
    '[󱆄  Keyword]',
    '[  Snippet]',
    '[  Color]',
    '[  File]',
    '[  Reference]',
    '[  Folder]',
    '[  EnumMember]',
    '[  Constant]',
    '[  Struct]',
    '[  Event]',
    '[  Operator]',
    '[  TypeParameter]',
  }
  -- for i, kind in ipairs(kinds) do
  --   kinds[i] = M.icons[i]
  --   print('TESTING')
  --   print(vim.inspect(kinds))
  --   print('TESTING')
  --   print(kind)
  --   print(M.icons[i])
  --   -- print(kinds[i])
  -- end

  -- vim.cmd([[ autocmd CursorHold  <buffer> silent! lua vim.lsp.buf.document_highlight() ]])
  -- vim.cmd([[ autocmd CursorHoldI <buffer> silent! lua vim.lsp.buf.document_highlight() ]])
  -- vim.cmd([[ autocmd CursorMoved <buffer> silent! lua vim.lsp.buf.clear_references() ]])
  --
  -- vim.cmd([[ highlight LspReference guifg=#3b4252 guibg=#88c0d0 ctermbg=59 ]])
  -- vim.cmd([[ highlight! link LspReferenceText LspReference ]])
  -- vim.cmd([[ highlight! link LspReferenceRead LspReference ]])
  -- vim.cmd([[ highlight! link LspReferenceWrite LspReference ]])
end

return M
