set shortmess+=I

augroup EnterMessage
	autocmd VimEnter * if !argc() && (line2byte('$') == -1) && (v:progname =~? '^[-gmnq]\=vim\=x\=\%[\.exe]$')
	\ | normal i
augroup END
