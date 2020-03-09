function! Termstart()
	let s="term"
	if stridx(expand('%:p'), s) == '0'
		setlocal nonumber norelativenumber
	endif
endfunction

augroup terminal
	autocmd WinNew,BufNew,BufNewFile,BufEnter,WinEnter * call Termstart()
augroup END
