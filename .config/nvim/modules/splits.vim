set splitbelow splitright
noremap <leader>z :vsplit 
noremap <leader>Z :split 

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c
noremap <A-j> <C-w>+
noremap <A-k> <C-w>-
noremap <A-h> <C-w>>
noremap <A-l> <C-w><

function! Netrwmap(filetype)
	if a:filetype == 'netrw'
		silent! unmap! <c-l>
		noremap! <C-l> <C-w>l
	endif

	return 0
endfunction


augroup Netrwstop
	autocmd WinEnter,BufEnter * let _filetype=&filetype
	autocmd WinEnter,BufEnter * let _void=Netrwmap(_filetype)
augroup END

set fillchars+=vert:\|
