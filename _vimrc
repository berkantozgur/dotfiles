
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
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'spf13/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/ZoomWin'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ajh17/VimCompletesMe'

" Ncm2
if has('nvim')
        Plug 'ncm2/ncm2'
        Plug 'roxma/nvim-yarp'
        Plug 'HansPinckaers/ncm2-jedi'
else
        Plug 'ncm2/ncm2'
        Plug 'roxma/nvim-yarp'
        Plug 'HansPinckaers/ncm2-jedi'
        Plug 'roxma/vim-hug-neovim-rpc'
endif

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" UI
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'Yggdroot/indentLine'
Plug 'gmoe/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'joshdick/onedark.vim'
Plug 'Nequo/vim-allomancer'
Plug 'tyrannicaltoucan/vim-deep-space'
call plug#end()

"<=================================== Basic Settings ===================================>

set nocompatible
set number
set relativenumber
set colorcolumn=90
set cursorline
set t_Co=256
set termguicolors
set nobackup
set noswapfile
set nowritebackup
set mouse=a
set backspace=indent,eol,start
set incsearch
set hls
set laststatus=2
set showtabline=2
set statusline-=
set wildmenu
set showmatch
set ruler
set showcmd
set splitbelow
set splitright
set expandtab
set smarttab
set bs=2
set ts=4
set sw=8
set encoding=utf-8
set smartindent
set autoindent
set autochdir
set shiftround
set path+=**
set completeopt=menuone,noselect,noinsert
set shortmess+=c
set noshowmode


if has('gui_running')
        set guifont=Iosevka_Term_SS09_Semibold:h11
        set guioptions-=e
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
endif

filetype off
filetype plugin indent on

" omnifuncs
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

nnoremap <space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

"<=================================== Plugin Settings ==================================>

" Theme
syntax enable
set background=dark
let g:gruvbox_italic=0
colorscheme gruvbox

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'],
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
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" Indentline
let g:indentLine_enabled = 0
let g:indentLine_char = '┆'
let g:indentLine_color_gui = '#FF875F'

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeShowBookmarks = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '-'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-b> :NERDTreeToggle<CR>

" Signify
let g:signify_disable_by_default = 1

" Close-Tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['autopep8']}

" ncm2 settings
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let g:ncm2#matcher = 'substrfuzzy'
let g:python3_host_prog = 'D:\Python-3.7\python.exe'

