set nocompatible

" use 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" don't beep
set visualbell

syntax on
filetype plugin on

" additional file types, based on file extensions
au BufRead,BufNewFile *.pl,*.t,.psgi set filetype=perl

set autoindent
" set smartindent
