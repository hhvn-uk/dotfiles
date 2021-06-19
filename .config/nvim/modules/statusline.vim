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
		let lcol = 'InsertMode'
	elseif l:mode == 'terminal '
		let lcol = 'TerminalMode'
	elseif l:mode == 'command '
		let lcol = 'CommandMode'
	elseif l:mode == 'visual ' || l:mode == 'v-block ' || l:mode == 'v-line ' || l:mode == 'select '
		let lcol = 'VisualMode'
	else
		let lcol = 'NormalMode'
	endif
	
	execute 'hi link Modecol ' . lcol
	return ''
endfunction

function! Gitbranch()
	return g:system("git branch | tr -d '\n'")
endfunction

function! Activestatus()
	set termguicolors
	""File
	let g:s.="%#Filecol#"
	let g:s.=" %f\ -\ %y%m "
	let g:s.="%#Basecol#"
	""Mode
	let g:s.="%#Modecol#"
	let g:s.=" %{Modecurrent()}"
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

	return g:s
endfunction

function! TermIstatus()
	""Reminder
	let g:s.="%="
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
