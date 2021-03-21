"<====================================== Mappings ======================================>
let g:mapleader=","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <Leader>y "*y
noremap <Leader>p "*p

nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" Spell Check
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" FZF
map <Leader>f :Files<CR>
map <Leader>g :GFiles<CR>
map <Leader>gs :GFiles?<CR>

" Vimtex
nnoremap <leader>lt :call vimtex#fzf#run()<cr>

" Fern
map <C-b> :Fern . -drawer -toggle<CR>

