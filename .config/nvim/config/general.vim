"<================================== General Settings ==================================>

filetype plugin indent on
filetype off

set nocompatible
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set noswapfile

set number relativenumber
set cursorline
set colorcolumn=90

set autoindent
set smartindent

set t_Co=256
set termguicolors

set clipboard=unnamedplus
set mouse=a
set backspace=indent,eol,start
set modelines=0
set path+=**
set wildmenu
set wildignorecase
set incsearch
set hls
set showmatch
set ruler
set showcmd
set splitbelow splitright
set expandtab
set smarttab
set bs=2
set ts=4
set sw=8
set autochdir
set shiftround
set completeopt=menuone,noselect,noinsert
set shortmess+=c
"set conceallevel=1

" Spell Check
set spelllang=en_gb
autocmd BufRead,BufNewFile *.md,*.tex,*.txt  setlocal spell

" Omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

autocmd FileType html let b:vcm_tab_complete = "omni"
autocmd FileType css let b:vcm_tab_complete = "omni"

" Remove trailing whitespaces and ^M chars
augroup ws
          au!
            autocmd FileType c,cpp,java,php,js,json,css,scss,sass,py,rb,coffee,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup end

" Deoplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

