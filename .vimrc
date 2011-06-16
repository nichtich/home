set nocompatible

set autoindent
" set smartindent

" use 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4

set visualbell " don't beep

syntax on

" additional file types, based on file extensions
au BufRead,BufNewFile *.pl,*.t set filetype=perl

