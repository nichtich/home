set nocompatible

" enable vundle
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'vim-pandoc'

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

