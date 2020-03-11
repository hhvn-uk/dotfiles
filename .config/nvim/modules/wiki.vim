augroup wikimaps
	autocmd WinNew,WinEnter,BufNew,BufEnter *.wiki :call Wikimaps()
augroup END

let g:vimwiki_listsyms='-~=X'

function! Wikimaps()
	nnoremap <buffer> <leader>Wt :VimwikiTable 
	nnoremap <buffer> <leader>W2h :Vimwiki2HTML
	" To be continued
endfunction

