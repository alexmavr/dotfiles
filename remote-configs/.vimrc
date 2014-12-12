
" To install:
"
" curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh 
"
set encoding=utf-8

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'shougo/neocomplete.vim'
NeoBundle 'Shougo/echodoc.vim'
NeoBundle 'kien/tabman.vim'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'fisadev/fisa-vim-colorscheme'
NeoBundle 'pyflakes.vim'
NeoBundle "Blackrush/vim-gocode"
NeoBundle "nsf/gocode"
NeoBundle "davidhalter/jedi-vim"

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256\|rxvt'
	let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif


set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set colorcolumn=80
set smarttab
set shiftround
set nojoinspaces

set showmatch       "jump to matching brace after 3 seconds
set matchtime=3

set diffopt+=iwhite
set ttyfast

let mapleader=","

" syntax coloring
syntax on 

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" autofocus on Tagbar open
let g:tagbar_autofocus = 1


" tab navigation
map <Tab> :tabn<CR>
map <S-Tab> :tabp<CR>
map <C-T> :tabnew<CR>


" Echodoc
set cmdheight=2
set completeopt+=menuone
"set completeopt-=preview

let g:neocomplete#enable_at_startup = 1
let g:echodoc_enable_at_startup = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" golang fix
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'

" integration with jedi
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled=0

