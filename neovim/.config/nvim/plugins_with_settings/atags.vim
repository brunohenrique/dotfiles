Plug 'fntlnz/atags.vim'
autocmd BufWritePost * call atags#generate()

let g:atags_build_commands_list = ["ctags -R"]

