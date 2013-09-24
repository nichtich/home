set nocompatible

" use 256 colors
set t_Co=256

" enable vundle
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'

Bundle 'vim-pandoc'
let g:pandoc_no_folding = 1
let g:pandoc_use_hard_wraps = 1

Bundle 'scrooloose/syntastic'
let g:syntastic_perl_lib_path="./lib,./local/lib/perl5"

set laststatus=2

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
"    set mouse=a                 " Automatically enable mouse usage
"    set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

" }

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" enable bash aliases
let $BASH_ENV = "~/.bash_aliases"
