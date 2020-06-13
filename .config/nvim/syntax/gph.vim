if exists("b:current_syntax")
 	finish
endif

runtime! syntax/markdown.vim

syn match gphBrackl '^\[' contained
syn match gphBrackr '\]$' contained
syn match gphPipe '|' contained

syn keyword gphSelf server port contained

syn region gphSelector start=/^\[/ end=/\]$/ oneline contains=gphBrackl,gphBrackr,gphPipe,gphSelf

syn match gphTab '	'

hi gphPunc guifg=#a1a1d9
hi link gphBrackl gphPunc
hi link gphBrackr gphPunc
hi link gphPipe gphPunc
hi gphSelf guifg=#005f5f
hi link gphTab errormsg

let b:current_syntax='gph'
