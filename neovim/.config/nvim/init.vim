" ================ General Config ====================

"turn on syntax highlighting
syntax on

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" http://sunaku.github.io/tmux-24bit-color.html#usage
if (has("nvim"))
  " For Neovim 0.1.3 and 0.1.4
  " https://github.com/neovim/neovim/pull/2198
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" For Neovim > 0.1.5 and Vim > patch 7.4.1799
" https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
"
" Based on Vim patch 7.4.1770 (`guicolors` option)
" https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has("termguicolors"))
  set termguicolors
endif

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

" 50 characters for Git commit's title and 72 characters for commit's body
autocmd FileType gitcommit set spell textwidth=72
autocmd FileType gitcommit set colorcolumn=+1
autocmd FileType gitcommit set colorcolumn+=51

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
