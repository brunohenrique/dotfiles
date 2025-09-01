------------------- Helpers ---------------------
local function imap(...)
  vim.keymap.set("i", ...)
end
local function nmap(...)
  vim.keymap.set("n", ...)
end
local function smap(...)
  vim.keymap.set("s", ...)
end

-- For more information :h lua-vim-options
local cmd = vim.cmd -- Behaves like :cmd('<something>')
local opt = vim.opt -- Behaves like :set
local go = vim.go -- Behaves like :setglobal
local bo = vim.bo -- Behaves like :setlocal for buffer-local options
local wo = vim.wo -- Behaves like :setlocal for window-local options
local fn = vim.fn -- Call Vim functions
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-------------------- Options ---------------------
-- opt.spell = true
opt.shell = "/bin/bash"
opt.modeline = true
opt.laststatus = 3
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.autoread = true -- Reload files changed outside vim
opt.showmode = true -- Show current mode down the bottom
opt.visualbell = true -- No sounds
opt.timeoutlen = 2000 -- http://usevim.com/2014/07/11/key-speed/
opt.ttimeoutlen = 0
-- opt.lazyredraw = true -- http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
opt.splitbelow = true -- Horizontal split below current.
opt.splitright = true -- Vertical split to right of current.
opt.wrap = false -- Don't wrap lines
opt.linebreak = true -- Wrap lines at convenient points"
opt.scrolloff = 8 -- Start scrolling when we're 8 lines away from margins
opt.sidescrolloff = 15
opt.sidescroll = 1
opt.signcolumn = "yes"

-- Turn Off Swap Files
opt.swapfile = false
opt.backup = false
opt.wb = false

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2 -- TODO: Need in comparison to shiftwidth
opt.softtabstop = 2
opt.shiftround = true
opt.smarttab = true
opt.shiftwidth = 2

-- opt.loaded_python3_provider = false
-- opt.loaded_ruby_provider = false
-- opt.loaded_node_provider = false
-- opt.loaded_perl_provider = false

-- Completion
opt.wildmenu = true -- Enable ctrl-n and ctrl-p to scroll through matches
opt.wildmode = "list:longest"

-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
opt.completeopt = { "menuone", "noinsert", "noselect" }

opt.wildignore:append({ "*.png", "*.jpg", "*.gif" })
opt.wildignore:append({ "*DS_Store*" })
opt.wildignore:append({ "*vim/backups*" })
opt.wildignore:append({ ".tags" })
opt.wildignore:append({ "log/**" })
opt.wildignore:append({ "tmp/**" })
opt.wildignore:append({ "*.o", "*.obj", "*~" })

-- Persistent Undo
-- Keep undo history across sessions, by storing in file.
cmd([[ silent !mkdir ~/.nvim/backups > /dev/null 2>&1 ]])
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.nvim/backups"

-- Netrw
cmd([[ let netrw_altv = 1 ]])
cmd([[ let netrw_liststyle = 3 ]])

local group = augroup("highlight_yank", { clear = true })
autocmd("TextYankPost", {
  group = group,
  pattern = "*",
  command = 'silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}',
})

-- Automatically rebalance windows on vim resize
autocmd("VimResized", { pattern = "*", command = ":wincmd =" })

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  -- virtual_text = {
  --   prefix = "●", -- Could be '■', '▎', 'x'
  --   source = "if_many",
  -- },
  float = {
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

nmap("<space>dd", "<CMD>lua vim.diagnostic.enable(false)<CR>", { desc = "Disable Diagnostics", remap = false })
nmap("<space>de", "<CMD>lua vim.diagnostic.enable(true)<CR>", { desc = "Enable Diagnostics", remap = false })
nmap(
  "<space>e",
  '<CMD>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>',
  { desc = "Diagnostics", remap = false }
)
nmap(
  "<space>wl",
  "<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  { desc = "Inspect Workspace Folder", remap = false }
)
nmap(
  "[d",
  '<CMD>lua vim.diagnostic.goto_prev({ float = { border = "single" }})<CR>',
  { desc = "Previus Diagnostics", remap = false }
)
nmap(
  "]d",
  '<CMD>lua vim.diagnostic.goto_next({ float = { border = "single" }})<CR>',
  { desc = "Next Diagnostics", remap = false }
)
imap("<C-C>", "<Esc>", { desc = "My ESC Remap", remap = false })

require("config.lazy")
