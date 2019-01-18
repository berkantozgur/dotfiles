
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

"if has('nvim')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"Plug 'Valloric/YouCompleteMe'
"endif

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" UI
Plug 'Yggdroot/indentLine'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'itchyny/lightline.vim'
Plug 'gmoe/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
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
set path+=**
set laststatus=2
set noshowmode
set statusline-=
set incsearch
set hls

if has('gui_running')
        set guifont=Source_Code_Pro_for_Powerline:h12
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
endif

filetype off
filetype plugin indent on

" Syntax and Completion
set omnifunc=syntaxcomplete#Complete
autocmd FileType html let b:vcm_tab_complete = "omni"

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

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"<=================================== Plugin Settings ==================================>

" Theme
syntax enable
set background=dark
"let g:gruvbox_italic=0
let g:nord_comment_brightness = 15
colorscheme nord

" Lightline
let g:lightline = {
        \ 'colorscheme': 'nord',
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
    "let g:startify_custom_header = [
                            "\'   _  _  _ _____ _______ ______  ______ _______  . _______      _    _ _____ _______ ',
                            "\'   |  |  |   |   |_____|  ____/ |_____/    |       |______       \  /    |   |  |  | ',
                            "\'   |__|__| __|__ |     | /_____ |    \_    |       ______|        \/   __|__ |  |  | ',
                            "\ ]

" Indentline
let g:indentLine_enabled = 0
let g:indentLine_char = '┆'

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

" YouCompleteMe
"set completeopt-=preview
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_key_invoke_completion = '<C-e>'

" Deoplete
"let g:deoplete#enable_at_startup = 1
