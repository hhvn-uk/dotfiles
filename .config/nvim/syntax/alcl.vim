if exists("b:current_syntax")
 	finish
endif

runtime! syntax/markdown.vim

syn match alclComment '^!.*'

hi link alclComment Comment
