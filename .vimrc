 
  "  __      _______ __  __ _____   _____ 
  "  \ \    / /_   _|  \/  |  __ \ / ____|
  "   \ \  / /  | | | \  / | |__) | |     
  "    \ \/ /   | | | |\/| |  _  /| |     
  "     \  /   _| |_| |  | | | \ \| |____ 
  "      \/   |_____|_|  |_|_|  \_\\_____|

call plug#begin('$HOME/.vim/bundle')

" Programming 
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'HansPinckaers/ncm2-jedi'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'w0rp/ale'
Plug 'ajh17/VimCompletesMe'
Plug 'sheerun/vim-polyglot'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
"Plug 'jreybert/vimagit'

" UI
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'chrisbra/colorizer'
Plug 'oblitum/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'Yggdroot/indentLine'

" Colors  
Plug 'gmoe/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kaicataldo/material.vim'

" Features
Plug 'scrooloose/nerdcommenter'
Plug 'spf13/vim-autoclose'
Plug 'matze/vim-move'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'vimwiki/vimwiki'

call plug#end()

"<================================== General Settings ==================================>

filetype plugin indent on
filetype off

set nocompatible
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set noswapfile

set number
set relativenumber
set cursorline
set colorcolumn=90

set autoindent
set smartindent

set t_Co=256
set termguicolors

set mouse=a
set backspace=indent,eol,start
set modelines=0
set path+=**
set wildmenu
set wildignorecase
set incsearch
set hls
set laststatus=2
set showtabline=2
set statusline-=
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
set noshowmode
syntax enable

if has('gui_running')
        set guifont=FiraCode_NF:h12
        set guioptions-=e
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L

        if $VIM_FULLSCREEN_DLL_FIX
                else
            autocmd GUIEnter * call libcall("loadfixgvimborder.dll", "LoadFixGVimBorder", "#282828")
            let $VIM_FULLSCREEN_DLL_FIX = 1
        endif

endif

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

" Ncm2
function s:ncm2_start(...)
        if v:vim_did_enter
            call ncm2#enable_for_buffer()
        endif
        autocmd BufEnter * call ncm2#enable_for_buffer()
endfunc
call timer_start(500, function('s:ncm2_start'))

"<====================================== Mappings ======================================>

let g:mapleader=","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

map <C-b> :NERDTreeToggle<CR>

"<===================================== Colorscheme ====================================>

set background=dark
"let g:gruvbox_italic=0
"let ayucolor="mirage"
"let g:seoul256_background = 234
"let g:material_theme_style = 'default'
colorscheme material

"<=================================== Plugin Settings ==================================>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ncm2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let g:ncm2#matcher = 'substrfuzzy'
let g:python3_host_prog = 'D:\Anaconda3\python.exe'
"let g:python3_host_prog = 'D:\Python-3.7\python.exe'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['autopep8']}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Close-Tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_disable_by_default = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowLineNumbers = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = 'Ψ'
let g:NERDTreeDirArrowCollapsible = 'Ω'
"let g:NERDTreeDirArrowExpandable = '›'

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], ['filetype'],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

      "\ 'separator': { 'left': ' ', 'right': ' ' },
      "\ 'subseparator': { 'left': ' ', 'right': ' ' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType c,python call rainbow#load()
"let g:rainbow_active = 1

