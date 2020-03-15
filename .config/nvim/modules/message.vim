set shortmess+=I

augroup EnterMessage
	autocmd VimEnter * if !argc() && (line2byte('$') == -1) && (v:progname =~? '^[-gmnq]\=vim\=x\=\%[\.exe]$')
	\ | call VimEnterDisplay()
	\ | endif
augroup END

function! VimEnterDisplay()
	set noswapfile
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

	redir! >/tmp/vim-recent | silent! echo '  "q"=empty buffer, "Q"=quit, all else below:' | silent! echo '' | silent! echo '   Recent files:' | redir END
	redir! >/tmp/vim-recent.1 | silent! echo '' | silent! echo '' | silent! echo 'Config files:' | redir END
	redir! >/tmp/vim-recent.2 | silent! echo '' | silent! echo '' | silent! echo 'Recent files (cwd):' | redir END
	redir! >/tmp/vim-recent.3 | silent! echo '' | silent! echo '' | silent! echo 'General:' | redir END
	redir! >/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> <c-k>' | silent! echo ':silent! unmap <buffer> q' | silent! echo 'nnoremap <buffer> q :q<CR>:new<CR>:only<CR>' | silent! echo ':silent! unmap <buffer>Q' | silent! echo ':no <buffer> Q :qa!<CR>' | silent! echo ':nnoremap <buffer>: <CR>' | redir END
	for string in olist
		let string=substitute(string, $HOME, "~", "")
		if i=='10'
			break
		elseif stridx(string, "NetrwTreeListing") == '-1' && stridx(string, "/tmp/vim-recent") == '-1' && stridx(string, expand("~/.config/nvim/startup.greet")) == '-1'
			redir >>/tmp/vim-recent | silent! echo '   [' . i . '] ' . string | redir END
			redir >>/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> ' . i | silent! echo ':nnoremap <buffer> ' . i . ' :q<CR>:edit ' . string '<CR>' | redir END
		else
			continue
		endif
		let i+=1
	endfor
	let i=10
	for string in olist
		let string=substitute(string, $HOME, "~", "")
		if i=='20'
			break
		elseif stridx(string, "~") != '-1' && stridx(string, "NetrwTreeListing") == '-1' && stridx(string, "/tmp/vim-recent") == '-1' && stridx(string, expand("~/.config/nvim/startup.greet")) == '-1'
			redir >>/tmp/vim-recent.2 | silent! echo '[' . i . '] ' . string | redir END
			redir >>/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> ' . i | silent! echo ':nnoremap <buffer> ' . i . ' :q<CR>:edit ' . string '<CR>' | redir END
		else
			continue
		endif
		let i+=1
	endfor
	call LauncherConfig()
	call LauncherGeneral()
	call LauncherFileMerge()
	let null=system("rm $HOME/.local/share/nvim/swap/%tmp%vim-recent.swp")
	edit! /tmp/vim-recent
	source /tmp/vim-recentcmd.vim
	setlocal syntax=recent nomodifiable
	set swapfile
endfunction

function! LauncherFileMerge()
	let w=&columns
	execute ':silent !pr -mtw ' . w . ' /tmp/vim-recent /tmp/vim-recent.* > /tmp/vim-recent-concat'
	execute ':silent !mv /tmp/vim-recent-concat /tmp/vim-recent'
endfunction

function! LauncherConfig()
	let configs=[
				\":Explore ~/.config/",
				\":edit ~/.config/nvim/init.vim",
				\":Explore ~/.config/nvim/modules",
				\":Explore ~/.config/nvim/syntax",
				\":Explore ~/.config/nvim/colors",
				\]
	let g:i=1
	for config in configs
		let a=Itoa(g:i)
		redir! >/tmp/vim-config-dict | silent! echo config | redir END
		let string=system("awk '{$1=\"\";print $0}' < /tmp/vim-config-dict | tr -d '\n\r'")

		redir >>/tmp/vim-recent.1 | silent! echo '[' . a . '] ' . string | redir END
		redir >>/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> ' . a | silent! echo ':nnoremap <buffer> ' . a . ' :q<CR>' . config . '<CR>' | redir END
		let g:i+=1
	endfor

endfunction

function! LauncherGeneral()
	let general=[
				\":!sxiv ~/.config/nvim/cheat.png::: View cheatsheet (only works with `sxiv`)",
				\":chdir ::: Change Directory",
				\":set path=::: Set (vim) path",
				\":set path+=::: Append (vim) path",
				\]
	for gen in general
		let a=Itoa(g:i)
		redir! >/tmp/vim-config-dict | silent! echo gen | redir END
		let string=system("grep -o ':::.*$' < /tmp/vim-config-dict | sed 's/^::://' | tr -d '\n\r'")
		let cmd=system("grep -o '^.*:::' < /tmp/vim-config-dict | sed 's/:::$//' | tr -d '\n\r'")

		redir >>/tmp/vim-recent.3 | silent! echo '[' . a . ']' . string | redir END
		redir >>/tmp/vim-recentcmd.vim | silent! echo ':silent! unmap <buffer> ' . a | silent! echo ':nnoremap <buffer> ' . a . ' :call LauncherGeneral' . a . '("")<left><left>' | silent! echo 'silent! function! LauncherGeneral' . a . '(arg)' | silent! echo 'execute "' . cmd . '" . a:arg' | silent! echo "call LauncherRecent()" | silent! echo 'endfunction'| redir END
		let g:i+=1
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
	elseif i=='11'
		let a='k'
	elseif i=='12'
		let a='l'
	elseif i=='13'
		let a='m'
	elseif i=='14'
		let a='n'
	elseif i=='15'
		let a='o'
	elseif i=='16'
		let a='p'
	elseif i=='17'
		let a='q'
	elseif i=='18'
		let a='r'
	elseif i=='19'
		let a='s'
	elseif i=='20'
		let a='t'
	elseif i=='21'
		let a='u'
	elseif i=='22'
		let a='v'
	elseif i=='23'
		let a='w'
	elseif i=='24'
		let a='z'
	elseif i=='25'
		let a='y'
	elseif i=='26'
		let a='z'
	endif


	return a
endfunction
