setlocal nonumber norelativenumber
if exists("b:current_syntax")
	finish
endif

syn match gAscii '|.*|'
syn match gCommand ':[A-Za-z!]* [A-Za-z/~\.]*'
syn match gText '^\s*[A-Za-z].*'
hi gAscii cterm=none ctermbg=1 ctermfg=12 gui=none guifg=#1f8a27 guibg=#24283c
hi gCommand cterm=none ctermbg=none ctermfg=13 gui=none guifg=#a84b8d guibg=none
hi gText cterm=none ctermbg=none ctermfg=255 gui=none guifg=#eeeeee
setlocal fcs=eob:\ 
