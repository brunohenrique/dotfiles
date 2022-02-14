require('plugins')

------------------- Helpers ---------------------
function nmap(...) vim.api.nvim_set_keymap('n', ...) end
function imap(...) vim.api.nvim_set_keymap('i', ...) end

-- For more information :h lua-vim-options
local cmd = vim.cmd -- Behaves like :cmd('<something>')
local opt = vim.opt -- Behaves like :set
local go  = vim.go  -- Behaves like :setglobal
local bo  = vim.bo  -- Behaves like :setlocal for buffer-local options
local wo  = vim.wo  -- Behaves like :setlocal for window-local options
local fn  = vim.fn  -- Call Vim functions

-------------------- Options ---------------------
opt.spell          = false
opt.termguicolors  = true  -- Enable 24-bit RGB colors
opt.number         = true
opt.relativenumber = true
opt.cursorline     = true
opt.autoread       = true  -- Reload files changed outside vim
opt.showmode       = true  -- Show current mode down the bottom
opt.visualbell     = true  -- No sounds
opt.timeoutlen     = 2000  -- http://usevim.com/2014/07/11/key-speed/
opt.ttimeoutlen    = 0
opt.lazyredraw     = true  -- http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
opt.splitbelow     = true  -- Horizontal split below current.
opt.splitright     = true  -- Vertical split to right of current.
opt.wrap           = false -- Don't wrap lines
opt.linebreak      = true  -- Wrap lines at convenient points"
opt.scrolloff      = 8     -- Start scrolling when we're 8 lines away from margins
opt.sidescrolloff  = 15
opt.sidescroll     = 1

-- Turn Off Swap Files
opt.swapfile = false
opt.backup   = false
opt.wb       = false

-- Indentation
opt.autoindent  = true
opt.smartindent = true
opt.expandtab   = true
opt.tabstop     = 2 -- TODO: Need in comparison to shiftwidth
opt.softtabstop = 2
opt.shiftround  = true
opt.smarttab    = true
opt.shiftwidth  = 2

-- Completion
opt.wildmenu = true -- Enable ctrl-n and ctrl-p to scroll through matches
opt.wildmode = 'list:longest'

-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
opt.completeopt = { 'menuone',  'noinsert', 'noselect' }

opt.wildignore:append { '*.png', '*.jpg', '*.gif' }
opt.wildignore:append { '*DS_Store*' }
opt.wildignore:append { '*vim/backups*' }
opt.wildignore:append { '.tags' }
opt.wildignore:append { 'log/**' }
opt.wildignore:append { 'tmp/**' }
opt.wildignore:append { '*.o', '*.obj', '*~' }

-- Persistent Undo
-- Keep undo history across sessions, by storing in file.
cmd([[ silent !mkdir ~/.nvim/backups > /dev/null 2>&1 ]])
opt.undofile = true
opt.undodir  = os.getenv 'HOME' .. '/.nvim/backups'

cmd([[
  " Netrw
  let netrw_altv = 1
  let netrw_liststyle = 3
]])

cmd([[
  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
  augroup END
]])

cmd([[
  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
]])

imap('<C-c>', '<Esc>', { noremap = true })
nmap('<Left>', '<CMD>echoe "Use h"<CR>', { noremap = true })
nmap('<Right>', '<CMD>echoe "Use l"<CR>', { noremap = true })
nmap('<Up>', '<CMD>echoe "Use k"<CR>', { noremap = true })
nmap('<Down>', '<CMD>echoe "Use j"<CR>', { noremap = true })
