function Shconfig()
	nnoremap <buffer> <localleader>s i#!/bin/sh<CR>#<CR># <++><CR># Created by Hayden Hamilton<CR>#<CR># haydenvh.com<CR># Copyright (c) <++> Hayden Hamilton<CR><CR>cache=${XDG_CACHE_HOME:=$HOME/.cache}<CR>config=${XDG_CONFIG_HOME:=$HOME/.config}<esc>
	nnoremap <buffer> <localleader>S i# <++><CR># Created by Hayden Hamilto<CR>#<CR># haydenvh.com<CR># Copyright (c) <++> Hayden Hamilton<CR>#<CR># THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR<CR># IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,<CR># FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE<CR># AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER<CR># LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,<CR># OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE<CR># SOFTWARE.<CR>#<CR># This work is free. You can redistribute it and/or modify it under the<CR># terms of the Do What The Fuck You Want To Public License, Version 2,       <CR># as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.<CR><CR># <++><CR><CR>cache=${XDG_CACHE_HOME:=$HOME/.cache}<CR>config=${XDG_CONFIG_HOME:=$HOME/.config}<esc>
	nnoremap <buffer> <localleader>x :w<CR>:!chmod +x %<CR>
	nnoremap <buffer> <localleader>f i(){<CR><CR>}<esc>kk0i
	nnoremap <buffer> <localleader>$ i$()<esc>i
	nnoremap <buffer> <localleader>($ i$(())<esc>hi
	nnoremap <buffer> <localleader>$ca i$cache
	nnoremap <buffer> <localleader>$co i$config
	nnoremap <buffer> <localleader><space> i[[:space:]]<esc>
	inoremap <buffer> <localleader><localleader><space> [[:space:]]
	iabbrev <buffer> ccachedir cache=${XDG_CACHE_HOME:=$HOME/.cache}
	iabbrev <buffer> cconfigdir cache=${XDG_CONFIG_HOME:=$HOME/.config}
endfunction

function Gphconfig()
	nnoremap <buffer> <localleader>c :call GphCitation()<CR>
	nnoremap <buffer> <localleader>t :%s/\t/        /g<CR>
	nnoremap <buffer> <localleader>l :call GphZettel("")<left><left>
	inoremap <buffer> <localleader><localleader>l <esc>:call GphZettel("")<left><left>
	call EnableLineWrap()
endfunction

function GphZettel(srch)
	redir! >/tmp/vim.zettel | silent! echo 'When positioned over a line, use <localleader>z to select and name it' | silent! echo 'Use <localleader>Z to finish' | silent! silent! execute ':!alcl find "' . a:srch . '"' | redir END
	vsplit /tmp/vim.zettel
endfunction

function GphZettelFin()
	mark `
	read !sed -n 's/[[:space:]]*\[/\t[/;s/][[:space:]]*/]\t/;/^\!/p' < /tmp/vim.zettel | awk -F'\t' '{print $2}'
	normal G
	read !sed -n 's/[[:space:]]*\[/\t[/;s/][[:space:]]*/]\t/;/^\!/p' < /tmp/vim.zettel | awk -F'\t' '{print "[<++>|"$2"|"$3"|server|port]"}'
	normal ``kJ$
endfunction

function GphCitation()
	redir! >/tmp/vim-cite | silent! %s/\[[0-9]*\]//gn | redir END
	let count=system("tail -n 1 < /tmp/vim-cite | awk '{print $1}'")
	let void=system("printf '' > /tmp/vim-cite")
	let done=1
	normal G
	while done <= count
		redir! >> /tmp/vim-cite | silent! echo "[<++>|[". done ."]|<++>|<++>|<++>]" | redir END
		let done+=1
	endwhile
	read /tmp/vim-cite
endfunction

function Txtconfig()
	call EnableLineWrap()
	setlocal syntax=markdown
endfunction

function EnableLineWrap()
	setlocal colorcolumn=80
	setlocal tw=80
	setlocal fo+=t
endfunction

augroup filetypes
	autocmd FileType,WinEnter,BufEnter netrw call Configurenetrw()
	autocmd FileType html :normal gg=G
	autocmd FileType html :setlocal nowrap
	autocmd FileType c :noremap <buffer> <localleader>e $a;<esc>
	autocmd FileType c :inoremap <buffer> <localleader><localleader>e <esc>$a;<esc>
	autocmd FileType sh :call Shconfig()
	autocmd FileType gph :call Gphconfig()
	autocmd FileType text :call Txtconfig()
	autocmd FileType mail :call EnableLineWrap()
augroup END
