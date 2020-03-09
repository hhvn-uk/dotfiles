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
noremap <A-h> <C-w><
noremap <A-l> <C-w>>

inoremap <C-h> <C-w>h
inoremap <C-j> <C-w>j
inoremap <C-k> <C-w>k
inoremap <C-l> <C-w>l
inoremap <C-c> <C-w>c
inoremap <A-j> <C-w>+
inoremap <A-k> <C-w>-
inoremap <A-h> <C-w><
inoremap <A-l> <C-w>>

function! Netrwmap(filetype)
	if a:filetype == 'netrw'
		unmap! <c-l>
		noremap! <C-l> <C-w>l
	endif

	return 0
endfunction


augroup Netrwstop
	autocmd WinEnter,BufEnter * let _filetype=&filetype
	autocmd WinEnter,BufEnter * let _void=Netrwmap(_filetype)
augroup END

set fillchars+=vert:\ 
hi VertSplit	ctermbg=0 ctermfg=0
hi StatusLine	ctermbg=0 ctermfg=0
