call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rstacruz/sparkup'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ajmwagar/vim-deus'
call plug#end()

" Basic Settings
set number
set relativenumber
set splitbelow
set splitright
set bs=2
set colorcolumn=90
set cursorline
set title
set incsearch
set hlsearch
set mouse=a
set termguicolors
set t_Co=256

nnoremap <space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Plugin Settings


" Deoplete
let g:deoplete#enable_at_startup = 1

" Theme
set background=dark
colorscheme gruvbox


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
