local opt = vim.opt_local

opt.wildignore:append { "*.gem" }
opt.wildignore:append { "*DS_Store*" }
opt.wildignore:append { "*sass-cache*" }
opt.wildignore:append { "vendor/assets/**" }
opt.wildignore:append { "vendor/cache/**" }
opt.wildignore:append { "vendor/rails/**" }
