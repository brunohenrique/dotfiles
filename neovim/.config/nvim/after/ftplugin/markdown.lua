local opt = vim.opt_local

opt.spell        = true
opt.conceallevel = 0
opt.textwidth    = 80
opt.colorcolumn:append { vim.opt.textwidth:get() }
