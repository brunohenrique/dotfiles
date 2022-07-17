vim.api.nvim_create_autocmd('BufWinEnter', { pattern = '<buffer>', command = 'wincmd L' })
vim.opt_local.number = true
