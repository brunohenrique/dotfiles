return {
  'fatih/vim-go',
  ft = { 'go' },
  config = function()
    -- These options are disabled to favor the nvim-lspconfig setup:
    -- GoToDefinition -> lua vim.lsp.buf.definition()
    vim.g.go_def_mapping_enabled = false
    -- GoDoc -> lua vim.lsp.buf.hover()
    vim.g.go_doc_keywordprg_enabled = false
    vim.g.go_gopls_enabled = false
    vim.g.go_fmt_fail_silently = true
  end,
}
