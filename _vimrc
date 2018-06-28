call plug#begin('$HOME/vimfiles/bundle')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'rstacruz/sparkup'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ajmwagar/vim-deus'
call plug#end()

" Basic Settings
set t_Co=256
set termguicolors
set mouse=a
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
set hlsearch
set mouse=a
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
colorscheme gruvbox
set background=dark

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowBookmarks=1
map <tab> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall