local opt        = vim.opt_local

opt.spell        = true
opt.conceallevel = 0
opt.textwidth    = 80
opt.colorcolumn:append { vim.opt.textwidth:get() }

local file_path = vim.fn.expand('%')
if (string.find(file_path, "logbook") and vim.fn.getfsize(file_path) < 1) then
  vim.cmd([[
    0read ~/.config/nvim/skeletons/logbook.md
  ]])
end
