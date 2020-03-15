setlocal nonumber norelativenumber
if exists("b:current_syntax")
	finish
endif

syn match rNum '\[[0-9]*\]'
syn match rChar '\[[A-Za-z]*\]'
syn match rHead '^\s*["A-Za-z0-9].*'
hi rNum cterm=none ctermfg=30 gui=none guifg=#008787
hi rChar cterm=none ctermfg=28 gui=none guifg=#008700
hi rHead cterm=bold ctermfg=255 gui=bold guifg=#eeeeee
