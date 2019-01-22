
"██╗    ██╗██╗███████╗ █████╗ ██████╗ ████████╗███████╗    ██╗   ██╗██╗███╗   ███╗
"██║    ██║██║╚══███╔╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝    ██║   ██║██║████╗ ████║
"██║ █╗ ██║██║  ███╔╝ ███████║██████╔╝   ██║   ███████╗    ██║   ██║██║██╔████╔██║
"██║███╗██║██║ ███╔╝  ██╔══██║██╔══██╗   ██║   ╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
"╚███╔███╔╝██║███████╗██║  ██║██║  ██║   ██║   ███████║     ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚══╝╚══╝ ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝

call plug#begin('$HOME/vimfiles/bundle')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
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
Plug 'Yggdroot/indentLine'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'itchyny/lightline.vim'
Plug 'ajmwagar/vim-deus'
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Nequo/vim-allomancer'
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
set statusline-=
set wildmenu
set showmatch
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
        set guifont=Iosevka_Term_SS09_Semibold:h12
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
"let g:gruvbox_italic=0
"let g:nord_comment_brightness = 15
colorscheme allomancer

" Lightline
let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'component': {
        \   'lineinfo': ' %3l:%-2v',
        \ },
        \ 'component_function': {
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
    function! LightlineReadonly()
        return &readonly ? '' : ''
    endfunction
    function! LightlineFugitive()
        if exists('*fugitive#head')
            let branch = fugitive#head()
            return branch !=# '' ? ''.branch : ''
        endif
        return ''
    endfunction

" Startify
    let g:startify_custom_header = [
                            \'      /$$$$$$  /$$                                                                ',
                            \'     /$$__  $$| $$                                                                ',
                            \'    | $$  \__/| $$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$/$$$$   /$$$$$$  /$$$$$$$     ',
                            \'    |  $$$$$$ | $$__  $$ /$$__  $$ /$$__  $$| $$_  $$_  $$ |____  $$| $$__  $$    ',
                            \'     \____  $$| $$  \ $$| $$$$$$$$| $$  \__/| $$ \ $$ \ $$  /$$$$$$$| $$  \ $$    ',
                            \'     /$$  \ $$| $$  | $$| $$_____/| $$      | $$ | $$ | $$ /$$__  $$| $$  | $$    ',
                            \'    |  $$$$$$/| $$  | $$|  $$$$$$$| $$      | $$ | $$ | $$|  $$$$$$$| $$  | $$    ',
                            \'     \______/ |__/  |__/ \_______/|__/      |__/ |__/ |__/ \_______/|__/  |__/    ',
                            \ ]

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

" Ctrlp
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0

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

