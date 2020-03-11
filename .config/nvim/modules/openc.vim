function! OpenC(arg)
	let file='<cWORD>'
	if a:arg == '0'
		let split="vsplit"
	elseif a:arg == '1'
		let split="split"
	else
		let split="edit"
	endif
	execute ":" . split . " " . file
endfunction

nnoremap <leader>Ew :call OpenC(2)<CR>
nnoremap <leader>EZ :call OpenC(1)<CR>
nnoremap <leader>Ez :call OpenC(0)<CR>
