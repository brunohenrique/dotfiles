local fn = vim.fn

if fn.filereadable(fn.expand('%')) == 0 then
  vim.cmd([[
    0read ~/.config/nvim/skeletons/script.sh
  ]])
end
