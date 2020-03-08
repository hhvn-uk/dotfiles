hi Modecol	ctermbg=10 ctermfg=254 gui=bold
hi Basecol 	ctermbg=0
hi Filecol 	ctermbg=2 ctermfg=7 gui=bold
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

augroup Statusline
	autocmd!
	autocmd WinEnter,BufEnter * setlocal statusline=%!Activestatus()
	autocmd WinLeave,BufLeave * setlocal statusline=%!Inactivestatus()
augroup END
