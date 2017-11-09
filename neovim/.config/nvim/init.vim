" ================ General Config ====================

"turn on syntax highlighting
syntax on

set number
set relativenumber

"Reload files changed outside vim
set autoread

"Show current mode down the bottom
set showmode

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" The encoding written to file
set fileencoding=utf-8

"No sounds
set visualbell

" http://usevim.com/2014/07/11/key-speed/
set timeoutlen=2000 ttimeoutlen=0

" http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw

" Disable mouse click to go to position
set mouse-=a


" ==========  More natural splits ==========
" Horizontal split below current.
set splitbelow
" Vertical split to right of current.
set splitright

autocmd Filetype gitcommit setlocal spell textwidth=72

" Ctrl+R reloads the ~/.config/nvim/init.vim file
nnoremap <F12> :source ~/.config/nvim/init.vim

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" ================ Plugins ====================
if filereadable(expand("~/.config/nvim/bundles.vim"))
  source ~/.config/nvim/bundles.vim
endif

" Show “invisible” characters
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

"Don't wrap lines
set nowrap

"Wrap lines at convenient points"
set linebreak

" ================ Scrolling ========================

"Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.nvim/backups > /dev/null 2>&1
set undodir=~/.nvim/backups
set undofile

" ================ Indentation ======================

set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2

" ================ Completion =======================

set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=*sass-cache*
set wildignore+=*vim/backups*
set wildignore+=.tags
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/assets/**
set wildignore+=vendor/cache/**
set wildignore+=vendor/rails/**
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~ 
"enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
set wildmode=list:longest


" ================ Visual ==================
colorscheme Tomorrow-Night-Eighties
colorscheme base16-ocean
let base16colorspace=256
set background=dark

" Highlight current line
set cursorline

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
