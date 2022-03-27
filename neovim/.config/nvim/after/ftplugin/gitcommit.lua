local opt = vim.opt_local

opt.spell     = true
opt.textwidth = 72
opt.colorcolumn:append { vim.opt.textwidth:get() }
opt.colorcolumn:append { 51 }
