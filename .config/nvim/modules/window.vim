hi Float ctermbg=0 cterm=none ctermfg=256

function! Winmsg()
	let width=&columns+4
	let height=20
	let top=&lines-height-1
	echo top
	let left=-2
	let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
	let opts.row += 1
	let opts.height -= 2
	let opts.col += 2
	let opts.width -= 4
	call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

function! Winset()
	setlocal winhl=Normal:Float
endfunction
