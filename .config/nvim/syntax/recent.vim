if exists("b:current_syntax")
	finish
endif

syn match rNum '\[[0-9]*\]'
syn match rChar '\[[A-Za-z]*\]'
syn match Head '^\s*[A-Za-z0-9].*'
hi rNum cterm=none ctermfg=30
hi rChar cterm=none ctermfg=28
hi Head cterm=bold ctermfg=255
