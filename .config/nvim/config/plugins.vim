call plug#begin('$HOME/.config/nvim/bundle')

" Programming 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'davidhalter/jedi-vim'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ajh17/VimCompletesMe'
Plug 'sheerun/vim-polyglot'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
"Plug 'jreybert/vimagit'

" File Manager
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'junegunn/fzf.vim'

" UI
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'frazrepo/vim-rainbow'
Plug 'Yggdroot/indentLine'

" Colors  
Plug 'joshdick/onedark.vim'
Plug 'saltdotac/citylights.vim'
Plug 'crusoexia/vim-monokai'
Plug 'danilo-augusto/vim-afterglow'
Plug 'vimoxide/vim-cinnabar'
Plug 'lifepillar/vim-solarized8'
Plug 'ajh17/Spacegray.vim'

" Misc
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

