set shortmess+=I

augroup EnterMessage
	autocmd VimEnter * if !argc() && (line2byte('$') == -1) && (v:progname =~? '^[-gmnq]\=vim\=x\=\%[\.exe]$')
	\ | call VimEnterDisplay()
	\ | endif
augroup END

function! VimEnterDisplay()
	edit ~/.config/nvim/startup.greet
	set syntax=greet
	call SpawnLauncher()
endfunction

function! SpawnLauncher()
	call Winmsg()
	call LauncherRecent()
	call Winset()
endfunction

function! FzfLauncher()
	call Winmsg()
	" fzf
	call Winset()
endfunction

function! LauncherRecent()
	rshada!
	let olist=v:oldfiles
	let i=0

	redir! >/tmp/vim-recent | silent! echo '  Press "q" to open empty buffer, "Q" to quit, or any key below:' | silent! echo '' | silent! echo '   Recent files:' | redir END
	redir! >/tmp/vim-recent.1 | silent! echo '' | silent! echo '' | silent! echo 'Config files:' | redir END
	redir! >/tmp/vim-recent.2 | silent! echo '' | silent! echo '' | silent! echo 'Recent files (cwd):' | redir END
	redir! >/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> q' | silent! echo 'nnoremap <buffer> q :q<CR>:new<CR>:only<CR>' | silent! echo ':silent! unmap <buffer>Q' | silent! echo ':nnoremap <buffer> Q :qa!<CR>' | silent! echo ':nnoremap <buffer> :q :qa!<CR>' | redir END
	for string in olist
		if i=='10'
			break
		endif
		redir >>/tmp/vim-recent | silent! echo '   [' . i . '] ' . string | redir END
		redir >>/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> ' . i | silent! echo ':nnoremap <buffer> ' . i . ' :q<CR>:edit ' . string '<CR>' | redir END
		let i+=1
	endfor
	let dir=getcwd()
	let i=10
	for string in olist
		if i=='20'
			break
		endif
		if stridx(string, dir) != '-1'
			redir >>/tmp/vim-recent.2 | silent! echo '   [' . i . '] ' . string | redir END
			redir >>/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> ' . i | silent! echo ':nnoremap <buffer> ' . i . ' :q<CR>:edit ' . string '<CR>' | redir END
		else
			continue
		endif
		let i+=1
	endfor
	call LauncherConfig()
	call LauncherFileMerge()
	edit /tmp/vim-recent
	source /tmp/vim-recentcmd.vim
	setlocal syntax=recent nomodifiable
endfunction

function! LauncherFileMerge()
	let w=&columns
	execute ':silent !pr -mtw ' . w . ' /tmp/vim-recent /tmp/vim-recent.* > /tmp/vim-recent-concat'
	execute ':silent !mv /tmp/vim-recent-concat /tmp/vim-recent'
endfunction

function! LauncherConfig()
	let configs=[
				\":edit ~/.config/nvim/init.vim",
				\":Explore ~/.config/nvim/modules"
				\]

	let i=1
	for config in configs
		let a=Itoa(i)
		redir! >/tmp/vim-config-dict | silent! echo config | redir END
		let string=system("awk '{$1=\"\";print $0}' < /tmp/vim-config-dict | tr -d '\n\r'")

		redir >>/tmp/vim-recent.1 | silent! echo '   [' . a . '] ' . string | redir END
		redir >>/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> ' . a | silent! echo ':nnoremap <buffer> ' . a . ' :q<CR>' . config . '<CR>' | redir END
		let i+=1
	endfor

endfunction

function Itoa(i)
	let i=a:i
	let a=''
	if i=='1'
		let a='a'
	elseif i=='2'
		let a='b'
	elseif i=='3'
		let a='c'
	elseif i=='4'
		let a='d'
	elseif i=='5'
		let a='e'
	elseif i=='6'
		let a='f'
	elseif i=='7'
		let a='g'
	elseif i=='8'
		let a='h'
	elseif i=='9'
		let a='i'
	elseif i=='10'
		let a='j'
	endif

	return a
endfunction
