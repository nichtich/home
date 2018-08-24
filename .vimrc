set nocompatible

" define <leader> key and less short timeout
let mapleader = ","
set timeout timeoutlen=1500

" enable vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'stephpy/vim-php-cs-fixer'
let g:php_cs_fixer_path="~/.composer/vendor/bin/php-cs-fixer"
let g:pandoc#formatting#mode="h"
let g:pandoc#syntax#conceal#use=0
"Plugin 'vim-pandoc/vim-pandoc'
"alternatively disable vim-pandoc:
augroup pandoc_syntax
    au! BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
augroup END
Plugin 'scrooloose/syntastic'
let g:syntastic_perl_lib_path="./lib,./local/lib/perl5"
Plugin 'rking/ag.vim'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

" navigate in visual lines
"map <Up> g<Up>
"map <Down> g<Down>
"imap <Up> <C-[> g<Up>
"imap <Down> <C-[> g<Down>

set laststatus=2

filetype plugin indent on   " Automatically detect file types
"set mouse=a                " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8

if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif

color flattened_dark

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" maintain undo history between sessions
set undodir=~/.vim/undodir

" Allow easy running of perltidy when editing a perl file, bound to 'Ctrl+t'
:au Filetype perl nnoremap <C-t> :%!perltidy -q<CR>
:au Filetype perl vnoremap <C-t> <line1>,<line2>!perltidy -q<CR>

" small intend for XML, XSLT, HTML, JSON
:au Filetype xml setlocal ts=2 sw=2 sts=2 expandtab
:au Filetype xslt setlocal ts=2 sw=2 sts=2 expandtab
:au Filetype html setlocal ts=2 sw=2 sts=2 expandtab
:au Filetype json setlocal ts=2 sw=2 sts=2 expandtab

" keep tabs in TSV files
:au Filetype tsv setlocal noexpandtab

" enable bash aliases
let $BASH_ENV = "~/.bash_aliases"

