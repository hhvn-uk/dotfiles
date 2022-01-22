" Vim indent file
" Language:	rc
" Maintainer:	hhvn <dev@hhvn.uk>
" License:	This file is placed in the public domain.
"
" Written by hhvn.

if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal indentexpr=GetRcIndent()
setlocal indentkeys+=0},0)
setlocal nosmartindent

if exists("GetRcIndent")
	finish
endif

function! GetRcIndent()
	let curline = getline(v:lnum)
	let lnum = prevnonblank(v:lnum - 1)
	let pnum = prevnonblank(lnum - 1)

	if lnum == 0
		return 0
	endif

	let prevline = getline(pnum)
	let line = getline(lnum)
	let indent = indent(lnum)
	let origindent = indent

	if curline =~ '[})]'
		let prevline = line
		let line = curline
	endif

	let braces = s:Get_brace_balance(line, '{', '}')
	let indent += braces * &sw

	let braces = s:Get_brace_balance(line, '(', ')')
	let indent += braces * &sw

	if line =~ '[|\\]\s*$'
		if prevline =~ '[|\\]\s*$'
			let indent += 0
		elseif origindent == indent
			let indent += &sw
		endif
	endif

	return indent
endfunction

" Taken from awk indenter
function! s:Get_brace_balance( line, b_open, b_close )
   let line2 = substitute( a:line, a:b_open, "", "g" )
   let openb = strlen( a:line ) - strlen( line2 )
   let line3 = substitute( line2, a:b_close, "", "g" )
   let closeb = strlen( line2 ) - strlen( line3 )
   return openb - closeb
endfunction
