au BufNewFile,BufRead *.zettel set filetype=zettel
au BufNewFile,BufRead *.zettel set syntax=zettel
au BufNewFile,BufRead *.zettel nnoremap <buffer> <localleader>z 0i!<esc>wcw[]<left>
au BufNewFile,BufRead *.zettel nnoremap <buffer> <localleader>Z :w<CR>:bd<CR>:call GphZettelFin()<CR>
