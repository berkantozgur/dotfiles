"    _       _ __        _
"   (_)___  (_) /__   __(_)___ ___
"  / / __ \/ / __/ | / / / __ `__ \
" / / / / / / /__| |/ / / / / / / /
"/_/_/ /_/_/\__(_)___/_/_/ /_/ /_/

call plug#begin('$HOME/.config/nvim/bundle')

" Programming 
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'HansPinckaers/ncm2-jedi'
"Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
"Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'davidhalter/jedi-vim'
Plug 'w0rp/ale'
Plug 'ajh17/VimCompletesMe'
Plug 'sheerun/vim-polyglot'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
"Plug 'jreybert/vimagit'

" File Manager
Plug 'scrooloose/nerdtree'
Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UI
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'maximbaz/lightline-ale'
Plug 'Yggdroot/indentLine'

" Colors  
Plug 'gmoe/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'simonsmith/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'

" Misc
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
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
"function s:ncm2_start(...)
        "if v:vim_did_enter
            "call ncm2#enable_for_buffer()
        "endif
        "autocmd BufEnter * call ncm2#enable_for_buffer()
"endfunc
"call timer_start(500, function('s:ncm2_start'))

" Deoplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"<====================================== Mappings ======================================>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:mapleader=","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

map <C-b> :NERDTreeToggle<CR>

" Vifm
map <Leader>vv :Vifm<CR>

"<===================================== Colorscheme ====================================>

set background=dark
"colorscheme material
colorscheme base16-default-dark

"<=================================== Plugin Settings ==================================>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ncm2, Deoplete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let ncm2#popup_delay = 5
"let ncm2#complete_length = [[1, 1]]
"let g:ncm2#matcher = 'substrfuzzy'

let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['autopep8']}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python, Jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

let g:python3_host_prog = '/usr/bin/python3'
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
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      "\ 'colorscheme': 'material_vim',
      \ 'colorscheme': 'base16',
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
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'right',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'right',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

      "\ 'separator': { 'left': '', 'right': '' },
      "\ 'subseparator': { 'left': '', 'right': '' }

      "\ 'separator': { 'left': ' ', 'right': ' ' },
      "\ 'subseparator': { 'left': ' ', 'right': ' ' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorizer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = [ 'background' ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType c,python call rainbow#load()
"let g:rainbow_active = 1

