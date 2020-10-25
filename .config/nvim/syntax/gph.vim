set expandtab

if exists("b:current_syntax")
 	finish
endif

" The below aren't actually going to afffect the content, they're just there
" for my eyes. Comment at will.
runtime! syntax/markdown.vim
syn match  gphCitation '\[[^|]*\]' contains=gphCitationText,gphCitationBracks
syn match  gphCitationText '[^\[\]]' contained
syn match  gphCitationBracks '[\[\]]' contained

hi gphCitationText guifg=#005f5f
hi gphCitationBracks guifg=#a1a1d9
" END comment spree

syn match   gphSelector "|.*\]$"                                     contains=gphPipe,gphServer,gphURL,gphURI,gphFileDir,gphFileGph,gphFileCGI,gphFileDCGI,gphFileHTML,gphCitation
syn match   gphType "^\[.*\]$"                                       contains=gphBrackl,gphType1,gphType2,gphSelector,gphType3

syn match   gphType1     "[012456789gmsITi\+:;<PcMd\*\.]" contained
syn match   gphType2     "[hH]"                           contained
syn match   gphType3     "3"                              contained
syn match   gphServer    "[^|]*|[^|]*]"                   contained  contains=gphBrackr,gphSelf,gphErr,gphPipe,gphServer2
syn match   gphServer2   "[^|\]]*"                        contained  contains=gphBrackr,gphPipe
syn match   gphFileGph   "[^|]*\.gph|"                    contained  contains=gphPipe
syn match   gphFileDir   "[^|]*\/|"                       contained  contains=gphPipe
syn match   gphFileCGI   "[^|]*\.cgi|"                    contained  contains=gphPipe
syn match   gphFileDCGI  "[^|]*\.dcgi|"                   contained  contains=gphPipe
syn match   gphFileHTML  "[^|]*\.html|"                   contained  contains=gphPipe
syn match   gphURL       "URL:[^|]*|"                     contained  contains=gphPipe
syn match   gphURI       "URI:[^|]*|"                     contained  contains=gphPipe
syn match   gphBrackl    '^\['                            contained
syn match   gphBrackr    '\]$'                            contained
syn match   gphPipe      '|'                              contained
syn match   gphEscape    '^t'
syn match   gphTab       '	'
syn keyword gphSelf      server port                      contained
syn keyword gphErr       err Err                          contained

hi      gphPunc      guifg=#a1a1d9
hi      gphEscape    guifg=#00d7d7
hi link gphBrackl    gphPunc
hi link gphBrackr    gphPunc
hi link gphPipe      gphPunc
hi      gphSelf      guifg=#005f5f
hi link gphTab       errormsg
hi      gphType1     guifg=#575b72
hi      gphType2     guifg=#4747e1 
hi      gphType3     guifg=#dc6f3c
hi link gphErr       gphType3
hi      gphServer2   guifg=#a84b8d

hi      gphFileGph   guifg=#777b8e
hi link gphFileDir   gphFileGph
hi      gphFileCGI   guifg=#00af87
hi link gphFileDCGI  gphFileCGI
hi      gphFileHTML  guifg=#4747e1 gui=bold
hi      gphURL       guifg=#4747e1 gui=underline
hi link gphURI       gphErr

let b:current_syntax='gph'
