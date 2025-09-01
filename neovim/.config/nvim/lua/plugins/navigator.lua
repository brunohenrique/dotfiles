return {
  'ray-x/navigator.lua',
  event = 'LspAttach',
  enabled = false,
  dependencies = {
    { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
    { 'neovim/nvim-lspconfig' },
  },
  opts = {
    on_attach = function(client, bufnr)
      local protocol = require('vim.lsp.protocol')
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
    end,
    mason = true,
    default_mapping = false,
    lsp = { disable_lsp = { "all" } },
  }
}
