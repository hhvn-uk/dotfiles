function! Sedrun(args)
	write
	let cmd="sed -i '" . a:args . "' %"
	execute ":!" . cmd | redraw
	silent! edit!
endfunction

function! Grepwin(args, vert)
	if a:vert == '1'
		let split="vsplit"
	else
		let split="split"
	endif

	write
	let ftsave=&filetype
	let tmpfile=fnameescape(tempname())
	let cmd="grep '" . a:args . "' % > " . tmpfile
	execute ":!" . cmd | redraw
	
	silent! execute ":" . split . " " . tmpfile

	execute ":set filetype=" . ftsave
endfunction

nnoremap <leader>S :call Sedrun("")<left><left>
nnoremap <leader>Gh :call Grepwin("", 0)<left><left><left><left><left>
nnoremap <leader>Gv :call Grepwin("", 1)<left><left><left><left><left>
