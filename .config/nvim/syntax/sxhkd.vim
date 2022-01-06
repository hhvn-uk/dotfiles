if exists("b:current_syntax")
    finish
endif


syntax match sxhkd_binding "\v^.*$" contains=sxhkd_on_release,sxhkd_binding_pass,sxhkd_brace
syntax match sxhkd_on_release "\v^\@" contained
syntax match sxhkd_binding_pass "\v^\~" contained
syntax match sxhkd_exec "\v^\s+.*" contains=@sxhkd_shell
syntax match sxhkd_comment "\v#.*$"
syntax match sxhkd_brace "{[^}]*}" contained

highlight link sxhkd_comment Comment
highlight link sxhkd_binding Identifier
highlight link sxhkd_binding_on_release Conditional
highlight link sxhkd_binding_pass Constant
highlight link sxhkd_brace Macro

" match shell command
syntax include @sxhkd_shell syntax/rcshell.vim
syntax region shLine matchgroup=sxhkd_exec start=/\v^\s+\s/ end=/\v$/ contains=@sxhkd_shell

let b:current_syntax = "sxhkd"
