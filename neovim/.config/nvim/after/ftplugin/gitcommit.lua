local opt = vim.opt_local

opt.spell     = true
opt.textwidth = 72
opt.colorcolumn:append { vim.opt.textwidth:get() }
opt.colorcolumn:append { 51 }

vim.cmd([[
  iabbrev <buffer> co-author@ Co-authored-by: author <author@example.com><ESC>F:wve
]])
