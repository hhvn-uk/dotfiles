" Vim color file
" First created by:	Ron Aaron <ron@ronware.org>
" Modified by:		hhvn <hhvn@hhvn.uk>
" Last Change:		17 March 2020
"

set background=dark
syntax reset
hi clear
hi clear Normal
hi clear NonText
hi clear Visual
hi clear Search
hi clear Folded

hi comment		ctermfg=238 guifg=#434343 cterm=none         gui=none
hi constant		ctermfg=13  guifg=#a84b8d cterm=none         gui=none
hi identifier		ctermfg=14  guifg=#434343 cterm=none         gui=none
hi statement		ctermfg=11  guifg=#a1a1d9 cterm=none         gui=none
hi preproc		ctermfg=95  guifg=#875f5f cterm=none         gui=none
hi type			ctermfg=42  guifg=#3abf8f cterm=none         gui=none
hi special		ctermfg=255 guifg=#eeeeee cterm=none         gui=none
hi variable		ctermfg=38  guifg=#00afd7 cterm=none         gui=none
hi search		                          cterm=reverse,bold gui=reverse,bold
hi title		ctermfg=225 guifg=#66aa88 cterm=none         gui=none
hi label		ctermfg=255 guifg=#eeeeee cterm=none         gui=none
hi Visual		                          cterm=reverse      gui=reverse
hi hicomment 		cterm=bold ctermbg=3 ctermfg=255 guibg=#31364b guifg=#eeeeee gui=none,bold

hi Error ctermfg=10 ctermbg=0 guifg=#892b2b guibg=#141726 gui=none
hi ErrorMsg ctermfg=0 ctermbg=10 guibg=#892b2b guifg=#141726 gui=none
hi MsgArea ctermbg=0 guibg=#141726 gui=none
hi MsgSeparator ctermbg=1  guibg=#24283c gui=none cterm=none

hi LineNr	ctermfg=11 guifg=#616199 gui=none cterm=none
hi CursorLineNr ctermfg=11 guifg=#a1a1d9 gui=bold cterm=bold

hi SpellBad   ctermbg=1 ctermfg=10   guifg=#892b2b gui=bold cterm=bold
hi SpellCap   ctermbg=1 ctermfg=13   guifg=#a84b8d gui=bold cterm=bold
hi SpellRare  ctermbg=1                            gui=none,underline cterm=none,underline
hi SpellLocal ctermbg=1 ctermfg=255  guifg=#eeeeee gui=bold cterm=bold

hi MatchParen ctermfg=30 cterm=reverse guifg=#003740 gui=reverse
hi Underlined cterm=underline ctermfg=23 gui=underline guifg=#005f5f
hi ColorColumn guibg=#24283c

hi QuickScopePrimary   ctermfg=4 guifg=#575b72 cterm=bold,reverse gui=bold,reverse
hi QuickScopeSecondary ctermfg=7 guifg=#c7cad9 cterm=bold,reverse gui=bold,reverse

hi Statusbar 	ctermbg=0 ctermfg=0 guifg=#141726 guibg=#141726
hi Basecol 	ctermbg=1 ctermfg=7 guibg=#24283c
hi Filecol 	cterm=bold ctermbg=3 ctermfg=7 gui=bold guifg=#c7cad9 guibg=#40445c
hi Branchcol 	cterm=bold ctermbg=9 ctermfg=7 gui=bold guifg=#c7cad9 guibg=#4747e1
hi Positioncol 	cterm=bold ctermbg=3 ctermfg=254 gui=bold guifg=#e4e4e4 guibg=#40445c
hi Buffcol	ctermbg=4 ctermfg=159 guifg=#afffff guibg=#575b72

hi InsertMode	ctermfg=126 ctermbg=1 guifg=#af0087 guibg=#24283c gui=bold cterm=bold
hi TerminalMode	ctermfg=190 ctermbg=1 guifg=#d7ff00 guibg=#24283c gui=bold cterm=bold
hi CommandMode	ctermfg=24  ctermbg=1 guifg=#005f87 guibg=#24283c gui=bold cterm=bold
hi VisualMode	ctermfg=202 ctermbg=1 guifg=#ff5f00 guibg=#24283c gui=bold cterm=bold
hi NormalMode	ctermfg=7   ctermbg=1 guifg=#c7cad9 guibg=#24283c gui=bold cterm=bold

hi TabLine     cterm=none ctermfg=252  ctermbg=1 gui=none guifg=#d0d0d0 guibg=#24283c
hi TabLineSel  cterm=bold ctermfg=252  ctermbg=3 gui=bold guifg=#d0d0d0 guibg=#40445c
hi TabLineFill cterm=none              ctermbg=1 gui=none               guibg=#24283c

hi link Todo			hicomment
hi link Number			constant
hi link Float			constant
hi link Constant		constant
hi link Operator 		statement
hi link NvimInternalError	Error
hi link WarningMsg		ErrorMsg
hi link Search			search
hi link IncSearch		search
hi link string			constant
hi link Folded			Normal

" diff/patch files
hi diffAdded	ctermfg=36
hi diffRemoved	ctermfg=10
hi link diffFile	preproc
hi link diffNewFile	preproc
hi link diffOldFile	preproc
hi link diffIndexLine	preproc
hi link diffSubname	statement

" ksh/bash/posix
hi link shSetList		variable
hi link shShellVariables	variable
hi link shQuote			string

" markdown
hi link markdownHeadingDelimiter	preproc

" menu from ctrl+n or tab completions
hi Pmenu guifg=#1e5eb3 guibg=#141726
hi PmenuSel guifg=#141726 guibg=#777b8e gui=bold
hi PmenuSbar guibg=#24283c
hi PmenuThumb guibg=#892b2b

let g:colors_name = "hhvn"
