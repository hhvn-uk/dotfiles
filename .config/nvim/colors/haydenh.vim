" Vim color file
" Firstcreated by:	Ron Aaron <ron@ronware.org>
" Modified by:		Hayden Hamilton <hayden@haydenvh.com>
" Last Change:		17 March 2020

set background=dark
hi clear
if exists("syntax_on")
		syntax reset
endif
let g:colors_name = "haydenh"
" Modified for term colors
hi clear Normal
hi clear NonText
hi comment		ctermfg=14 guifg=#434343 gui=none
hi constant		ctermfg=13 guifg=#a84b8d gui=none
hi identifier	ctermfg=14 guifg=#434343 gui=NONE
hi statement	ctermfg=11 guifg=#a1a1d9 gui=NONE
hi preproc		ctermfg=44 guifg=#00d7d7 gui=none
hi type			ctermfg=85 guifg=#5fffaf gui=none
"hi type			ctermfg=243 guifg=#767676 gui=none
hi special		ctermfg=255 guifg=#eeeeee gui=none
hi link ErrorMsg Error
hi link WarningMsg Error
hi Cursor		cterm=reverse ctermfg=255 guifg=#eeeeee gui=reverse
hi Search		cterm=bold ctermbg=5 guibg=#777b8e gui=bold
hi IncSearch	cterm=bold ctermbg=5 guibg=#777b8e gui=bold
hi title		ctermfg=225 guifg=#ffd7ff gui=none
" hi ShowMarksHL ctermfg=cyan ctermbg=lightblue cterm=bold guifg=yellow guibg=black  gui=bold
hi label		ctermfg=255 guifg=#eeeeee gui=none
hi operator		ctermfg=240 guifg=#585858 gui=none
hi link Operator operator
hi clear Visual
hi Visual		cterm=reverse gui=reverse
" hi DiffChange   guibg=darkgreen
" hi DiffText		guibg=olivedrab
" hi DiffAdd		guibg=slateblue
" hi DiffDelete   guibg=coral
hi Folded		cterm=bold ctermfg=255 ctermbg=none guifg=#aaaaaa guibg=#555555 gui=bold
hi FoldColumn	cterm=none ctermfg=249 ctermbg=1 guifg=#b2b2b2 gui=none
" hi cIf0			guifg=gray
" hi diffOnly	guifg=red gui=bold

" Following section entirely created by Hayden Hamilton
hi Error ctermfg=10 ctermbg=0 guifg=#892b2b guibg=#141726 gui=none
hi link NvimInternalError Error
hi ErrorMsg ctermfg=0 ctermbg=10 guibg=#892b2b guifg=#141726 gui=none
hi link WarningMsg ErrorMsg
hi MsgArea ctermbg=0 guibg=#141726 gui=none
hi MsgSeparator ctermbg=1 guibg=#24283c gui=none
hi Todo cterm=bold ctermbg=3 ctermfg=255 guibg=#31364b guifg=#eeeeee gui=none,bold
hi Number ctermfg=13 guifg=#a84b8d
hi link Float Number
hi link Constant Number
hi LineNr ctermfg=11 guifg=#616199 gui=none
hi CursorLineNr ctermfg=11 gui=bold cterm=bold guifg=#a1a1d9
hi SpellBad ctermbg=1 ctermfg=10 guifg=#892b2b guibg=#24283c gui=none
hi SpellCap ctermbg=1 ctermfg=13 guifg=#a84b8d guibg=#24283c gui=none
hi SpellRare ctermbg=1 ctermfg=none cterm=underline guifg=none guibg=#24283c gui=none,underline
hi SpellLocal ctermbg=1 ctermfg=255 cterm=bold guifg=#eeeeee gui=none,bold
hi MatchParen ctermfg=30 cterm=reverse guifg=#003740 gui=reverse
hi Underlined cterm=underline ctermfg=23 gui=underline guifg=#005f5f
hi QuickScopePrimary guifg=#892b2b gui=bold,reverse
hi QuickScopeSecondary guifg=#d750d7 gui=bold,reverse
hi ColorColumn guibg=#24283c

" menu from ctrl+n or tab completions
hi Pmenu guifg=#1e5eb3 guibg=#141726
hi PmenuSel guifg=#141726 guibg=#777b8e gui=bold
hi PmenuSbar guibg=#24283c
hi PmenuThumb guibg=#892b2b
