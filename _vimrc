call plug#begin('$HOME/vimfiles/bundle')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

"Themes
Plug 'morhetz/gruvbox'
Plug 'Nequo/vim-allomancer'
Plug 'mhartington/oceanic-next'
Plug 'ajmwagar/vim-deus'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

" Basic Settings
set t_Co=256
set termguicolors
set mouse=a
set backspace=indent,eol,start
set number
set relativenumber
set colorcolumn=90
set cursorline
set wildmenu
set splitbelow
set splitright
set bs=2
set ts=4
set sw=8
set encoding=utf-8
set autoindent
set showmatch
set nocompatible
set smartindent
set smarttab
set shiftround
set expandtab
set laststatus=1
set incsearch
set hls
if has('gui_running')
        set guifont=Hack_NF:h13
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
endif
filetype off
filetype plugin indent on

nnoremap <space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Plugin Settings

" Theme
syntax enable
let g:vim_monokai_tasty_italic = 1
set background=dark
colorscheme vim-monokai-tasty

" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
map <tab> :NERDTreeToggle<CR>

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'monokai_tasty'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

