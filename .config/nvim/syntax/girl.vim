syn match GirlTit	"(o)"
syn match GirlBush	".##*."
syn match GirlCrotch1	"/[ ]*||[ ]*\\"		contains=GirlCock1
syn match GirlCrotch2	"/[ ]*(_*)[ ]*\\"	contains=GirlCock2
syn match GirlCrotch3	"/[ ]*/\\[ ]*\\"	contains=GirlCock3
syn match GirlCock1	"||"			contained
syn match GirlCock2	"(__)"			contained
syn match GirlCock3	"/\\"			contained
syn match GirlNavalC	"n()"			contains=GirlNaval,GirlNavalMark
syn match GirlNaval	"()"			contained
syn match GirlNavalMark	"n"			contained
syn match GirlAHole	"(\~)"
syn match GirlVag	"v..."			contains=GirlVagMark
syn match GirlVagMark	"v"			contained

hi      GirlTit		guifg=#aa2244
hi      GirlBush	guifg=#000000
hi      GirlCock1	guifg=#553315
hi link GirlCock2	GirlCock1
hi	GirlCock3	guifg=#a84b8d
hi      GirlNaval	guifg=#FFFAAA
hi      GirlAHole	guifg=#553315
hi	Normal		guifg=#aa9977 guibg=#0c1726
hi	GirlVag		guifg=#aa2244

hi	GirlVagMark	guifg=#0c1726
hi link	GirlNavalMark	GirlVagMark
