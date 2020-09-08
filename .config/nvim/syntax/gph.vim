if exists("b:current_syntax")
 	finish
endif

runtime! syntax/markdown.vim


syn region  gphSelector start=/|/ end=/\]$/ oneline contains=gphPipe,gphServer,gphURL,gphURI,gphFileDir,gphFileGph,gphFileCGI,gphFileDCGI,gphFileHTML
syn region  gphType start=/^\[/ end=/|/ oneline contains=gphBrackl,gphType1,gphType2,gphSelector

syn match   gphType1 "[0123456789gmsITi\+:;<PcMd\*\.]" contained
syn match   gphType2 "[hH]" contained
syn match   gphServer "[^|]*|[^|]*]" contained contains=gphBrackr,gphSelf,gphPipe,gphServer2
syn match   gphServer2 "[^|\]]*" contained contains=gphBrackr,gphPipe
syn match   gphFileGph "[^|]*\.gph|" contained contains=gphPipe
syn match   gphFileDir "[^|]*\/|" contained contains=gphPipe
syn match   gphFileCGI "[^|]*\.cgi|" contained contains=gphPipe
syn match   gphFileDCGI "[^|]*\.dcgi|" contained contains=gphPipe
syn match   gphFileHTML "[^|]*\.html|" contained contains=gphPipe
syn match   gphURL "URL:[^|]*|" contained contains=gphPipe
syn match   gphURI "URI:[^|]*|" contained contains=gphPipe
syn match   gphBrackl '^\[' contained
syn match   gphBrackr '\]$' contained
syn match   gphPipe '|' contained
syn match   gphEscape '^t'
syn match   gphTab '	'
syn keyword gphSelf server port contained

hi gphPunc guifg=#a1a1d9
hi gphEscape guifg=#00d7d7
hi link gphBrackl gphPunc
hi link gphBrackr gphPunc
hi link gphPipe gphPunc
hi gphSelf guifg=#005f5f
hi link gphTab errormsg
hi gphType1 guifg=#575b72
hi gphType2 guifg=#ebaa22
hi gphServer2 guifg=#a84b8d

hi gphFileGph guifg=#777b8e
hi link gphFileDir gphFileGph
hi gphFileCGI guifg=#00af87
hi link gphFileDCGI gphFileCGI
hi gphFileHTML guifg=#4747e1 gui=bold
hi gphURL guifg=#4747e1 gui=underline
hi link gphURI gphURL

let b:current_syntax='gph'
