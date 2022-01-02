autocmd BufRead,BufNewFile .rcrc*,rcrc,*.rc, set filetype=rcshell

function! s:DetectRcShell()
  let shebang = getline(1)
  if shebang =~# '#!.*rc.*'
    set filetype=rcshell
  endif
endfunction

autocmd BufRead,BufNewFile * call s:DetectRcShell()
