hi Statusbar 	ctermbg=0 ctermfg=0 guifg=#141726 guibg=#141726
hi Basecol 	ctermbg=1 guibg=#24283c
hi Filecol 	cterm=bold ctermbg=3 ctermfg=7 gui=bold guifg=#c7cad9 guibg=#40445c
hi Branchcol 	cterm=bold ctermbg=9 ctermfg=7 gui=bold guifg=#c7cad9 guibg=#4747e1
hi Positioncol 	cterm=bold ctermbg=3 ctermfg=254 gui=bold guifg=#e4e4e4 guibg=#40445c
hi Buffcol	ctermbg=4 ctermfg=159 guifg=#afffff guibg=#575b72

let g:currentmode={
			\'n' : 'Normal ',
			\'no' : 'N·Operator Pending ',
			\'v' : 'Visual ',
			\'V' : 'V·Line ',
			\'^V' : 'V·Block ',
			\'s' : 'Select ',
			\'S': 'S·Line ',
			\'^S' : 'S·Block ',
			\'i' : 'Insert ',
			\'R' : 'Replace ',
			\'Rv' : 'V·Replace ',
			\'c' : 'Command ',
			\'cv' : 'Vim Ex ',
			\'ce' : 'Ex ',
			\'r' : 'Prompt ',
			\'rm' : 'More ',
			\'r?' : 'Confirm ',
			\'!' : 'Shell ',
			\'t' : 'Terminal '
			\}

function! Modecurrent() abort
	let l:modecurrent = mode()
	let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
	let l:current_status_mode = l:modelist
	let l:lmode = tolower(l:current_status_mode)

	return l:current_status_mode
endfunction

function! Modecol()
	let other=''
	let l:mode=tolower(Modecurrent())

	if l:mode == 'insert '
		let gbg='#af005f'
	elseif l:mode == 'terminal '
		let gbg='#af8700'
	elseif l:mode == 'command '
		let gbg='#005f5f'
	elseif l:mode == 'visual ' || l:mode == 'v-block ' || l:mode == 'v-line ' || l:mode == 'select '
		let gbg='#af5f00'
	else
		let gbg='#892b2b'
	endif
	
	let hargs='gui=bold guifg=#e4e4e4 guibg=' . gbg . ' ' . other

	execute 'hi! Modecol ' . hargs
	return ''
endfunction

function! Gitbranch()
	return g:system("git branch | tr -d '\n'")
endfunction

function! Activestatus()
	""Mode
	let g:s.="%#Modecol#"
	let g:s.=" %{Modecurrent()}"
	let g:s.="%#Basecol#"
	""File
	let g:s.="%#Filecol#"
	let g:s.=" %f\ -\ %y%m "
	let g:s.="%#Basecol#"
	let g:s.="%="
	""Branch
	" let g:s.="%#Branchcol#"
	" let g:s.=" %{Gitbranch()} "
	" let g:s.="%#Basecol#"
	""Position
	let g:s.="%#Positioncol#"
	let g:s.=" %l/%L,\ %c "
	let g:s.="%#Basecol#"
	""Buffer
	let g:s.="%#Buffcol#"
	let g:s.=" [%n] "
	let g:s.="%#Basecol#"

	return g:s
endfunction

function! Inactivestatus()
	""File
	let g:s.="%#Basecol#"
	let g:s.=" %f\ -\ %y%m"

	return g:s
endfunction

function! NetrwAstatus()
	""Remimder
	let g:s.="%#Filecol#"
	let g:s.=" %y "
	let g:s.="%#Basecol#"

	return g:s
endfunction

function! NetrwIstatus()
	""Remimder
	let g:s.="%#Basecol#"
	let g:s.=" %y "

	return g:s
endfunction

function! TermAstatus()
	""Reminder
	let g:s.="%#Modecol#"
	let g:s.=" [terminal] "
	let g:s.="%#Basecol#"

	return g:s
endfunction

function! TermIstatus()
	""Reminder
	let g:s.="%#Basecol#"
	let g:s.=" [terminal] "

	return g:s
endfunction

augroup Statusline
	autocmd!
	autocmd FileType netrw let &l:statusline=Choosestatus(1, &filetype)
	autocmd WinEnter,BufEnter * let &l:statusline=Choosestatus(1, &filetype)
	autocmd WinNew,BufNew * let &l:statusline=Choosestatus(1, &filetype)
	autocmd WinLeave,BufLeave * let &l:statusline=Choosestatus(0, &filetype)
augroup END

function! Choosestatus(active, filetype)
	"Set active or inactive
	let g:s="%{Modecol()}"
	if a:active == '1'
		let statusline=Activestatus()
	else
		let statusline=Inactivestatus()
	endif

	"Overwrite if special
	let s="term"
	if a:filetype == 'netrw' && a:active == '1'
		let g:s=""
		let statusline=NetrwAstatus()
	elseif a:filetype == 'netrw'
		let g:s=""
		let statusline=NetrwIstatus()
	elseif stridx(expand('%:p'), s) == '0' && a:active == '1'
		let statusline=TermAstatus()
	elseif stridx(expand('%:p'), s) == '0'
		let statusline=TermIstatus()
	endif

	return statusline
endfunction
