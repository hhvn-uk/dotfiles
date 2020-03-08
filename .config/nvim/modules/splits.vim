set splitbelow splitright
noremap <leader>z :vsplit \| set linebreak<CR>
noremap <leader>Z :split \| set linebreak<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c
inoremap <C-h> <C-w>h
inoremap <C-j> <C-w>j
inoremap <C-k> <C-w>k
inoremap <C-l> <C-w>l
inoremap <C-c> <C-w>c

set fillchars+=vert:\ 
hi VertSplit	ctermbg=0 ctermfg=0
hi StatusLine	ctermbg=0 ctermfg=0
