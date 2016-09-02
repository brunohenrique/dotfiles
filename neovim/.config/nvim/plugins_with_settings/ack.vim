Plug 'mileszs/ack.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
" "
" " Adds :Ack complete w/ quick fix. I prefer to use :Ack! which does not open
" " the first thing it finds automatically.
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
map <leader>a :Ack!<space>
map <leader>A :Ack! <C-R><C-W><CR>
let g:ackprg="ag --nocolor --nogroup --column"
