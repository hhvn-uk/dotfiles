hi TabLine cterm=none ctermfg=252 ctermbg=1 gui=none guifg=#d0d0d0 guibg=#24283c
hi TabLineSel cterm=bold ctermfg=252 ctermbg=3 gui=bold guifg=#d0d0d0 guibg=#40445c
hi TabLineFill cterm=none ctermfg=none ctermbg=1 gui=none guifg=none guibg=#24283c

nnoremap <leader>te :tabedit 
nnoremap <leader>tf :tabfind 
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tb :tab ball<CR>
nnoremap <leader>th :tab help 
nnoremap <leader>tz :tab split<CR>
nnoremap <leader>tZ :tab split<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tN :tabNext<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tN :tablast<CR>
nnoremap <leader>tP :tabfirst<CR>

set showtabline=2
