function! Termstart()
	let s="term"
	if stridx(expand('%:p'), s) == '0'
		setlocal nonumber norelativenumber
	endif
endfunction

function! Termend()
	let s="term"
	if stridx(expand('%:p'), s) == '0'
		set termguicolors
	endif
endfunction

function! Quickterm()
	call Shwin()
	setlocal winhl=Normal:Float
	set notermguicolors
	terminal
endfunction

function! Shmenu(dir, prompt)
	call Shwin()
	setlocal winhl=Normal:Float
	execute 'silent! terminal find ' . a:dir . ' | shmenu ' . a:prompt . ' > /tmp/shmenu-out'
	startinsert
endfunction

function! Shwin()
	let width=(&columns-(&columns/3)-10)
	let height=(&lines-(&lines/3)-5)
	let top=(&lines-height)/2
	let left=(&columns-width)/2
	let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
	let opts.row += 1
	let opts.height -= 2
	let opts.col += 2
	let opts.width -= 4
	call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

command! -nargs=0 Quickterm call Quickterm()

augroup terminal
	autocmd WinNew,BufNew,BufNewFile,BufEnter,WinEnter * call Termstart()
	autocmd WinLeave,BufLeave,BufWinLeave * call Termend()
augroup END
