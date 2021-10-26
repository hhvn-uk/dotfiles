function Shconfig()
	nnoremap <buffer> <localleader>x :w<CR>:!chmod +x %<CR>
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
