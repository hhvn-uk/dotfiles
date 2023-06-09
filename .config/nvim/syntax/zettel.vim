if exists("b:current_syntax")
 	finish
endif

syn match zettelExc '^!' contained
syn match zettelBrackl '\[' contained
syn match zettelBrackr '\]' contained
syn match zettelBrackText '[^\[\]]' contained

syn match zettelSelected '^!.*$' contains=zettelExc,zettelBracks
syn match zettelBracks '\[.*\]' contained contains=zettelBrackl,zettelBrackr,zettelBrackText

hi zettelPunc guifg=#a1a1d9
hi link zettelExc zettelPunc
hi link zettelBrackl zettelPunc
hi link zettelBrackr zettelPunc
hi zettelBrackText guifg=#005f5f

let b:current_syntax='gph'
