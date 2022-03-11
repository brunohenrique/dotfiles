local M = {}

M.gopls = {
  experimentalPostfixCompletions = true,
  analyses = { unusedparams = true, shadow = true },
  staticcheck = true,
}

M["rust-analyzer"] = {
  assist = { importGranularity = "module", importPrefix = "by_self" },
  cargo = { loadOutDirsFromCheck = true },
  procMacro = { enable = true },
}

M.yaml = { schemas = { kubernetes = '**/templates/*.yaml' } }

return M
