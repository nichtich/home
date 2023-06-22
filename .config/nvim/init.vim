" plugins
call plug#begin()

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" jq
Plug 'vito-c/jq.vim'

" pandoc markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#modules#disabled = [ "spell" ]
let g:pandoc#syntax#conceal#use = 0

" perl
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

" vue
Plug 'posva/vim-vue'

" vim-airline (status bar)
Plug 'vim-airline/vim-airline'

call plug#end()

" I don't like folding enabled by default
set nofoldenable

" perl tidy when saving (TODO: may be easier with vim-perl plugin?) 
function! PerlTidyAndResetCursor ()
    let cursor_pos = getpos('.')
    %!perltidy -q
    call setpos('.', cursor_pos)
endfunction
augroup PerlTidy
    autocmd!
    autocmd BufWritePre,FileWritePre,FileAppendPre *.p[lm]  :call PerlTidyAndResetCursor()
augroup END

" enable bash aliases
let $BASH_ENV = "~/.bash_aliases"

" I don't like tabs except in TSV files
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" FIXME: file type tsv is not detected by default (?)
:au Filetype tsv setlocal noexpandtab

" small intend for XML, XSLT, HTML, JSON
:au Filetype xml setlocal ts=2 sw=2 sts=2 expandtab
:au Filetype xslt setlocal ts=2 sw=2 sts=2 expandtab
:au Filetype html setlocal ts=2 sw=2 sts=2 expandtab
:au Filetype json setlocal ts=2 sw=2 sts=2 expandtab


