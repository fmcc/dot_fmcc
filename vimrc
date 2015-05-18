set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'honza/vim-snippets'

" Haskell plugins
Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'lukerandall/haskellmode-vim'
"Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'

Plugin 'jceb/vim-orgmode'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'sirver/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic' 
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc'
Plugin 'sjl/gundo.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/VisIncr'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

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

"This sets 256 colours as options in Vim. 	
set t_Co=256
let base16colorspace=256

"Set a colour scheme for use with Vim
set background=dark
colorscheme base16-default

"This sets the number of items to save in the history
set history=1000

"This maps maps turning on and off spell checking with the F12 key
map <leader>s :set spell!<cr>

"Turn on spell checking with English dictionary
set spell
set spelllang=en_gb
set spellsuggest=9 "show only 9 suggestions for misspelled words

" Use incremental search, begins highlighting matches as you type.
set incsearch

" Enable the use of the mouse for visual mode editing. 
set mouse=a

" so that the mouse works in tmux
set ttymouse=xterm2

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" This is the actual Visual Search function. 
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" This enables automatic indentation as you type.
filetype indent on

syntax on
filetype indent plugin on
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

"line numbering
set number

" ctrl+n to open up nertree...
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$','\.hi$','\.o$']

" indent and break marker on linewrap
set breakindent
set showbreak=\|..

" Ensure that the air/(power) line is visible on startup
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" line highlighting when in insert mode.
hi Cursor ctermfg=red ctermbg=black
au InsertEnter * hi CursorLineNr ctermfg=red
au InsertLeave * hi CursorLineNr ctermfg=yellow
au InsertEnter * hi CursorLine cterm=none
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

map <leader>t "=strftime("%d/%m/%y %H:%M - ")<CR>Pa

nmap <C-b> :TagbarToggle<CR>

" haskellmode settings
let g:haddock_browser="/usr/bin/firefox"
au BufEnter *.hs compiler ghc

" Use neco-ghc as the backend for YCM completion. 
setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}

map <leader>s :%!stylish-haskell<CR>
