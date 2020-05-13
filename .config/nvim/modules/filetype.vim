function Shconfig()
	nnoremap <buffer> <localleader>s i#!/bin/sh<CR>#<CR># <++><CR># Created by Hayden Hamilton<CR>#<CR># haydenvh.com<CR># Copyright (c) <++> Hayden Hamilton<CR><CR>cache=${XDG_CACHE_HOME:=$HOME/.cache}<CR>config=${XDG_CONFIG_HOME:=$HOME/.config}<esc>
	nnoremap <buffer> <localleader>x :!chmod +x %<CR>
	nnoremap <buffer> <localleader>f i(){<CR><CR>}<esc>kk0i
	nnoremap <buffer> <localleader>$ i$()<esc>i
	nnoremap <buffer> <localleader>($ i$(())<esc>hi
	nnoremap <buffer> <localleader>$ca i$cache
	nnoremap <buffer> <localleader>$co i$config
	nnoremap <buffer> <localleader><space> i[[:space:]]<esc>
	nnoremap <buffer> <localleader><localleader><space> [[:space:]]
	iabbrev <buffer> ccachedir cache=${XDG_CACHE_HOME:=$HOME/.cache}
	iabbrev <buffer> cconfigdir cache=${XDG_CONFIG_HOME:=$HOME/.config}
endfunction

function Gphconfig()
	nnoremap <buffer> <localleader>c :call GphCitation()<CR>
endfunction

function GphCitation()
	redir! >/tmp/vim-cite | silent! %s/\[[0-9]*\]//gn | redir END
	let count=system("tail -n 1 < /tmp/vim-cite | awk '{print $1}'")
	let void=system("echo '' > /tmp/vim-cite")
	let done=1
	normal G
	while done <= count
		redir! >> /tmp/vim-cite | silent! echo "[<++>|[". done ."]|<++>|<++>|<++>]" | redir END
		let done+=1
	endwhile
	read /tmp/vim-cite
endfunction

augroup autocmd
	"netrw
	autocmd FileType,WinEnter,BufEnter netrw call Configurenetrw()

	"Get rid of shitty indenting
	autocmd FileType html :normal gg=G

	"Nowrap
	autocmd FileType html :setlocal nowrap

	"C
	autocmd FileType c :noremap <buffer> <localleader>e $a;<esc>
	autocmd FileType c :inoremap <buffer> <localleader><localleader>e <esc>$a;<esc>

	"SH
	autocmd FileType sh :call Shconfig()

	"GPH
	autocmd FileType *.gph :call Gphconfig()
augroup END
