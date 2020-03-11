hi Statusbar 	ctermbg=0 ctermfg=0
hi Modecol	ctermbg=10 ctermfg=254 gui=bold
hi Basecol 	ctermbg=1
hi Filecol 	ctermbg=3 ctermfg=7 gui=bold
hi Branchcol 	ctermbg=9 ctermfg=7 gui=bold
hi Positioncol 	ctermbg=3 ctermfg=254 gui=bold
hi Buffcol	ctermbg=4 ctermfg=159

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
	return l:current_status_mode
endfunction

function! Gitbranch()
	return system("git branch | tr -d '\n'")
endfunction

function! Activestatus()
	""Mode
	let s="%#Modecol#"
	let s.=" %{Modecurrent()}"
	let s.="%#Basecol#"
	""File
	let s.="%#Filecol#"
	let s.=" %f\ -\ %y%m "
	let s.="%#Basecol#"
	let s.="%="
	""Branch
	" let s.="%#Branchcol#"
	" let s.=" %{Gitbranch()} "
	" let s.="%#Basecol#"
	""Position
	let s.="%#Positioncol#"
	let s.=" %l/%L,\ %c "
	let s.="%#Basecol#"
	""Buffer
	let s.="%#Buffcol#"
	let s.=" [%n] "
	let s.="%#Basecol#"

	return s
endfunction

function! Inactivestatus()
	""File
	let s="%#Basecol#"
	let s.=" %f\ -\ %y%m"

	return s
endfunction

function! NetrwAstatus()
	""Remimder
	let s="%#Filecol#"
	let s.=" %y "
	let s.="%#Basecol#"

	return s
endfunction

function! NetrwIstatus()
	""Remimder
	let s="%#Basecol#"
	let s.=" %y "

	return s
endfunction

function! TermAstatus()
	""Reminder
	let s="%#Filecol#"
	let s.=" [terminal] "
	let s.="%#Basecol#"

	return s
endfunction

function! TermIstatus()
	""Reminder
	let s="%#Basecol#"
	let s.=" [terminal] "

	return s
endfunction

augroup Statusline
	autocmd!
	autocmd FileType netrw let _filetype=&filetype
	autocmd FileType netrw let &l:statusline=Choosestatus(1, _filetype)
	autocmd WinEnter,BufEnter * let _filetype=&filetype
	autocmd WinEnter,BufEnter * let &l:statusline=Choosestatus(1, _filetype)
	autocmd WinLeave,BufLeave * let &l:statusline=Choosestatus(0, _filetype)
augroup END

function! Choosestatus(active, filetype)
	"Set active or inactive
	if a:active == '1'
		let statusline=Activestatus()
	else
		let statusline=Inactivestatus()
	endif

	"Overwrite if special
	let s="term"
	if a:filetype == 'netrw' && a:active == '1'
		let statusline=NetrwAstatus()
	elseif a:filetype == 'netrw'
		let statusline=NetrwIstatus()
	elseif stridx(expand('%:p'), s) == '0' && a:active == '1'
		let statusline=TermAstatus()
	elseif stridx(expand('%:p'), s) == '0'
		let statusline=TermIstatus()
	endif

	return statusline
endfunction
