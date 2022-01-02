autocmd BufRead,BufNewFile .rcrc*,rcrc, set filetype=rcshell

function! s:DetectRcShell()
  let shebang = getline(1)
  if shebang =~# '\(/\|\s\)rc$'
    if shebang =~# '^#!'
      set filetype=rcshell
    endif
  endif
endfunction

autocmd BufRead,BufNewFile * call s:DetectRcShell()
