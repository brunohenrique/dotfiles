call plug#begin('~/.nvim/plugged')
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/unite.vim' | Plug 'Quramy/vison', { 'for': 'json' }
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'tpope/vim-rails'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jreybert/vimagit'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'

source ~/.config/nvim/plugins_with_settings/vim-devicons.vim
source ~/.config/nvim/plugins_with_settings/ack.vim
source ~/.config/nvim/plugins_with_settings/atags.vim
source ~/.config/nvim/plugins_with_settings/nerdtree.vim
source ~/.config/nvim/plugins_with_settings/tagbar.vim
source ~/.config/nvim/plugins_with_settings/vim-airline.vim
source ~/.config/nvim/plugins_with_settings/vim-gitgutter.vim
source ~/.config/nvim/plugins_with_settings/vim-go.vim
call plug#end()
