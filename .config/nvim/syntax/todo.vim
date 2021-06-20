if exists("b:current_syntax")
	finish
endif

set ts=4 sw=4 expandtab

syn match todoItem		'\[.\]' 	contains=todoItemDone,todoItemRevision,todoItemProgress,todoItemPrepared
syn match todoItemDone		'X'		contained
syn match todoItemRevision	'\*'		contained
syn match todoItemProgress	'-'		contained
syn match todoItemPrepared	'\.'		contained
syn match todoCategory		'^#.*'		contains=todoCategoryContent,todoCategoryDelim
syn match todoCategoryDelim	'[#]*'		contained
syn match todoCategoryContent	'[^#]*'		contained
syn match todoBullet		'^\s*[-+*]'

hi link	todoItem		Operator
hi	todoItemDone		ctermfg=46 cterm=bold guifg=#00aa00 gui=bold
hi	todoItemRevision	ctermfg=88 cterm=bold guifg=#aa0000 gui=bold
hi link	todoItemProgress	Operator
hi link	todoItemPrepared	Operator
hi link todoCategoryContent	Title
hi link todoCategoryDelim	Preproc
hi link todoCategory		todoCategoryDelim
hi link todoBullet		Statement
