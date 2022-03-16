local protocol = require('vim.lsp.protocol')
local M = {}

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#completion-kinds
M.protocol = function()
  protocol.CompletionItemKind = {
    '[  Text]',
    '[  Method]',
    '[  Function]',
    '[  Constructor]',
    '[  Field]',
    '[  Variable]',
    '[  Class]',
    '[ﰮ  Interface]',
    '[  Module]',
    '[  Property]',
    '[  Unit]',
    '[  Value]',
    '[  Enum]',
    '[  Keyword]',
    '[﬌  Snippet]',
    '[  Color]',
    '[  File]',
    '[  Reference]',
    '[  Folder]',
    '[  EnumMember]',
    '[  Constant]',
    '[  Struct]',
    '[  Event]',
    '[ﬦ  Operator]',
    '[  TypeParameter]',
  }
end

M.languages = {
  gopls = {
    analyses = { unusedparams = true, shadow = true },
    completeUnimported = true,
    experimentalPostfixCompletions = true,
    staticcheck = true,
  },
  ["rust-analyzer"] = {
    assist = { importGranularity = "module", importPrefix = "by_self" },
    cargo = { loadOutDirsFromCheck = true },
    checkOnSave = { command = "clippy" },
    completion = { autoimport = { enable = true } },
    procMacro = { enable = true },
  },
  yaml = { schemas = { kubernetes = '**/templates/*.yaml' } },
}

return M
