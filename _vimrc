
"██╗    ██╗██╗███████╗ █████╗ ██████╗ ████████╗███████╗    ██╗   ██╗██╗███╗   ███╗
"██║    ██║██║╚══███╔╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝    ██║   ██║██║████╗ ████║
"██║ █╗ ██║██║  ███╔╝ ███████║██████╔╝   ██║   ███████╗    ██║   ██║██║██╔████╔██║
"██║███╗██║██║ ███╔╝  ██╔══██║██╔══██╗   ██║   ╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
"╚███╔███╔╝██║███████╗██║  ██║██║  ██║   ██║   ███████║     ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚══╝╚══╝ ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝

call plug#begin('$HOME/vimfiles/bundle')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'spf13/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/ZoomWin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Themes
Plug 'zefei/vim-wintabs'
"Plug 'zefei/vim-wintabs-powerline'
Plug 'itchyny/lightline.vim'
Plug 'gmoe/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'ajmwagar/vim-deus'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'lifepillar/vim-solarized8'
call plug#end()

"<=================================== Basic Settings ===================================>
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
set autochdir
set showmatch
set showcmd
set nocompatible
set smartindent
set smarttab
set shiftround
set expandtab
set laststatus=2
set noshowmode
set statusline-=
set incsearch
set hls

if has('gui_running')
        set guifont=Hack_NF:h12
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
endif

filetype off
filetype plugin indent on

" Mappings
let g:mapleader=","

nnoremap <space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-T>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)

command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

"<=================================== Plugin Settings ==================================>

" Theme
syntax enable
set background=dark
let g:gruvbox_italic=0
colorscheme gruvbox

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeShowBookmarks = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '-'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-b> :NERDTreeToggle<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Close-Tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

