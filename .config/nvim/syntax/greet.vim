if exists("b:current_syntax")
	finish
endif

syn match gAscii '|.*|'
syn match gCommand ':[A-Za-z!]* [A-Za-z/~\.]*'
syn match gText '^\s*[A-Za-z].*'
hi gAscii cterm=none ctermbg=1 ctermfg=12
hi gCommand cterm=none ctermbg=none ctermfg=13
hi gText cterm=none ctermbg=none ctermfg=255
setlocal fcs=eob:\ 
set nonumber norelativenumber
