" Commenting of #endifs etc
" Author: Ben Schmidt, minor modifications by A. S. Budden.

augroup preproc
	au BufWrite *.[ch] :call SmartPreProcCommenter()
augroup END

function! SmartPreProcCommenter()
  mark y
  let saved_wrapscan=&wrapscan
  set nowrapscan
  let elsecomment=""
  let endcomment=""
  try
    " Find the last #if in the buffer
    $?^\s*#if
    while 1
      " Build the comments for later use, based on current line
      let content=getline('.')
      let endcomment=BuildEndComment(content,endcomment)
      " Change # into ## so we know we've already processed this one
      " and don't find it again
      s/^\s*\zs#/##
      " Find the next #else, #elif, #endif which must belong to this #if
      /^\s*#endif
      let content=getline('.')
      call setline('.',ReplaceComment(getline('.'),endcomment))
      s/^\s*\zs#/##
      " Find the previous #if
      ?^\s*#if
    endwhile
  catch /search hit TOP/
    " Once we have an error (pattern not found, i.e. no more left)
    " Change all our ## markers back to #
    silent! %s/^\s*\zs##/#
  endtry
  let &wrapscan=saved_wrapscan
  normal `y
endfunc

let s:PreProcCommentMatcher = '#\a\+\s\+\zs.\{-}\ze\(\s*\/\*.\{-}\*\/\)\?\s*$'

function! BuildEndComment(content,previous)
  let expression=escape(matchstr(a:content,s:PreProcCommentMatcher), '\~&')
  if match(a:content,'#ifdef') != -1
    return "/* ".expression." */"
  elseif match(a:content,'#ifndef') != -1
    return "/* not ".expression." */"
  elseif match(a:content,'#if') != -1
    return "/* ".expression." */"
  else
    return ""
  endif
endfunc

function! ReplaceComment(content,comment)
  let existing=escape(matchstr(a:content,'#\a\+\s\+\zs.\{-}\s*$'), '\~&')
  if existing == ""
    return substitute(a:content,'^\s*#\a\+\zs.*'," ".a:comment,'')
  elseif existing != a:comment && match(existing,'XXX') == -1
    return a:content." /* XXX */"
  else
    return a:content
  endif
endfunc
