set nocompatible
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set whichwrap+=<,>,h,l

syntax on

" Vundle Begins----------
" custom change: moved the following line to beginning 
" set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
" Plugin 'tomasiser/vim-code-dark'
" Plugin 'joshdick/onedark.vim'
" Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle Ends----------


" codedark, onedark, base16-default-dark are themes i like
let base16colorspace=256 " Access colors present in 256 colorspace
colorscheme default
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" highlight LineNr ctermfg=darkgrey ctermbg=NONE


" airline Begins--------

let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''

" use `:echo g:airline_symbols` to view entire symbols list
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.colnr = ': '

let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = ' '

let g:airline_theme='raven'

" airline Ends----------
