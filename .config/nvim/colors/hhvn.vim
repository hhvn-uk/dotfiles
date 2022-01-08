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
hi clear StatusLine
hi clear StatusLineNC

hi comment		ctermfg=238  cterm=none
hi constant		ctermfg=13   cterm=none
hi identifier		ctermfg=14   cterm=none
hi statement		ctermfg=5    cterm=none
hi preproc		ctermfg=95   cterm=none
hi type			ctermfg=11   cterm=bold
hi special		ctermfg=255  cterm=none
hi variable		ctermfg=38   cterm=none
hi search		             cterm=reverse,bold
hi title		ctermfg=225  cterm=none
hi label		ctermfg=255  cterm=none
hi Visual		             cterm=reverse
hi hicomment 		ctermfg=2    cterm=bold

hi Error ctermfg=10 ctermbg=0
hi ErrorMsg ctermfg=0 ctermbg=10
hi MsgArea ctermbg=0
hi MsgSeparator ctermbg=1    cterm=none

hi LineNr	ctermfg=3   cterm=none
hi CursorLineNr ctermfg=3   cterm=bold
hi CursorLine	ctermbg=none  cterm=none
set cursorline

hi SpellBad   ctermbg=1 ctermfg=10     cterm=bold
hi SpellCap   ctermbg=1 ctermfg=13     cterm=bold
hi SpellRare  ctermbg=1                cterm=none,underline
hi SpellLocal ctermbg=1 ctermfg=255    cterm=bold

hi MatchParen ctermfg=30 cterm=reverse
hi Underlined cterm=underline ctermfg=23

hi QuickScopePrimary   ctermfg=4      cterm=bold,reverse
hi QuickScopeSecondary ctermfg=7      cterm=bold,reverse

hi Statusbar 	ctermbg=1 ctermfg=0
hi Basecol 	ctermbg=1 ctermfg=5   cterm=bold
hi Blankcol	ctermbg=1 ctermfg=1
hi Filecol 	ctermbg=1 ctermfg=7   cterm=bold
hi Positioncol 	ctermbg=1 ctermfg=254 cterm=bold

hi InsertMode	ctermfg=13  ctermbg=1 cterm=bold
hi CommandMode	ctermfg=24  ctermbg=1 cterm=bold
hi VisualMode	ctermfg=8   ctermbg=1 cterm=bold
hi NormalMode	ctermfg=5   ctermbg=1 cterm=bold
hi VertSplit	ctermfg=1   ctermbg=1 cterm=none

hi TabLine     ctermfg=252  ctermbg=1 cterm=none
hi TabLineSel  ctermfg=252  ctermbg=3 cterm=bold
hi TabLineFill              ctermbg=1 cterm=none

hi clear Todo
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
hi link StatusLine		VertSplit
hi link StatusLineNC		VertSplit
hi link Function		comment
" The colour for comments just makes sense for functions, IMO

" diff/patch files
hi diffAdded	ctermfg=36
hi diffRemoved	ctermfg=10
hi link diffFile		preproc
hi link diffNewFile		preproc
hi link diffOldFile		preproc
hi link diffIndexLine		preproc
hi link diffSubname		statement

" ksh/bash/posix
hi link shSetList		variable
hi link shShellVariables	variable
hi link shQuote			string

" markdown
hi link markdownHeadingDelimiter preproc

" menu from ctrl+n or tab completions
hi Pmenu 	ctermfg=none ctermbg=0
hi PmenuSel 	ctermfg=0    ctermbg=7   cterm=bold

let g:colors_name = "hhvn"
