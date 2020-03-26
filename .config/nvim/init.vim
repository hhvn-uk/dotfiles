"
" .bashrc
" Created by Hayden Hamilton
"
" haydenvh.com
" Copyright (c) 2019 Hayden Hamilton.
"

"Note: plugins can found in .vim/plugin/ or .vim/autoload/
" goyo - centres text
" surround - allows operation on surrounding characters
" commentary - comments stuff out
" repeat - repeat things
" vimling (ipa, deadkeys) - deadkeys
" vimagit - git in vim
" vimwiki - wiki program (can view my wiki)

"Leader
let mapleader=";"
let maplocalleader=','

"Cursor
let &t_SI.="\033[6 q" "SI = INSERT mode
let &t_SR.="\033[4 q" "SR = REPLACE mode
let &t_EI.="\033[2 q" "EI = NORMAL mode (ELSE)

"Tab completion
set path+=**
set wildmenu
set wildmode=longest,list,full
set incsearch

"Misc
set encoding=utf-8

"Set scheme
syntax on
set termguicolors
colo haydenh
set background=dark
set relativenumber
set number
set hlsearch
filetype plugin on
set noshowmode

"Fold
set foldmethod=marker

"Leader keys
noremap <leader>vv :edit ~/.config/nvim/init.vim<CR>
noremap <leader>vz :vsplit ~/.config/nvim/init.vim<CR>
noremap <leader>vZ :split ~/.config/nvim/init.vim<CR>
noremap <leader>vs :source ~/.config/nvim/init.vim<CR>
map <leader><leader><leader> <leader>vs
noremap <leader>r :call ReopenFile()<CR>

function! ReopenFile()
	let curfile=expand('%:p')
	echom curfile
	execute 'write' . curfile
	execute 'edit' . curfile
endfunction

noremap <leader>g :Goyo \| set linebreak<CR>
noremap <leader>cd :chdir 
noremap <leader>ca :ColorizerAttachToBuffer<CR>
noremap <leader>cd :ColorizerDetachFromBuffer<CR>
noremap <leader>C :!sudo make all install clean<CR>
noremap <leader>oc :!groff -T pdf % - > /tmp/grff \| zathura -<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
noremap <leader>sv :!sent % \| set linebreak<CR> 
noremap <leader>sc :setlocal spell! spelllang=en_us \| set linebreak<CR>
noremap <leader>sf mm[s1z=`m<CR>
noremap <leader>ssf mm[sz=`m
noremap <leader>Ff :r !find \| set linebreak<CR>
noremap <leader>Fl :r !ls \| set linebreak<CR>
noremap <leader>bd :bdelete \| set linebreak<CR>
noremap <leader>bn :bn \| set linebreak<CR>
noremap <leader>bp :bp \| set linebreak<CR>
noremap <leader>mvg :r !find -maxdepth 1 -type f -printf "mv \"\%f\"\t<++>\n"<Enter>
noremap <leader>mvd :w! /tmp/bmv-edit \| set linebreak<CR>:!sh /tmp/bmv-edit \| set linebreak<CR>:q \| set linebreak<CR>
noremap <leader>ss :set syntax=
inoremap <leader><leader>ss <Esc>:set syntax=
noremap <leader>w :w \| set linebreak<CR>
noremap <leader>w! :w !sudo tee %<CR>
noremap <leader>wq :x!<CR>
noremap <leader>" ea"<esc>bi"<esc>
noremap <leader>u" ds"
noremap <leader>' ea'<esc>bi'<esc>
noremap <leader>u' ds'
noremap <leader>sp o<esc>pi
noremap <leader>Ee :edit 
noremap <leader>yv :reg<CR>

noremap <leader>nn :set number! relativenumber!<CR>
noremap <leader><leader>nn :setlocal number! relativenumber!<CR>

noremap <leader>j 0/<++><Enter>"_c4l
noremap <leader>J 0/<++><Enter>"_d4l
inoremap <leader><leader>j <Esc>0/<++><Enter>"_c4l
noremap <leader>C i<++><Esc>
inoremap <leader><leader>c <++><Enter>

noremap <leader><leader>[ i[]<Esc><Left>i
noremap <leader><leader>( i()<Esc><Left>i
noremap <leader><leader>" i""<Esc><Left>i
noremap <leader><leader>' i''<Esc><Left>i
noremap <leader><leader>{ i{}<Esc><Left>i
noremap <leader><leader>< i<><Esc><Left>i
inoremap <leader><leader>[ []<Esc><Left>i
inoremap <leader><leader>( ()<Esc><Left>i
inoremap <leader><leader>" ""<Esc><Left>i
inoremap <leader><leader>' ''<Esc><Left>i
inoremap <leader><leader>{ {}<Esc><Left>i
inoremap <leader><leader>< <><Esc><Left>i

"General stuff
noremap dw diw
noremap dew dw
noremap cw ciw
noremap cew cw
noremap dl 0d$

noremap md ddp
noremap mu ddkkp
noremap <c-U> viwU
noremap <c-i> viwu

"Insert mode
inoremap <c-d> <esc>ddi
inoremap <c-c> <esc>cci
inoremap <c-r> <esc>lr
inoremap <c-R> <esc>lR
inoremap <c-v> <esc>lv
inoremap <c-p> <esc>lpli
inoremap <c-P> <esc>lPli

"Folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Magit
noremap <leader>m :Magit \| set linebreak<CR>
let g:magit_default_fold_level=0

"Vimling
noremap <leader>ld :call ToggleDeadKeys()<CR>
inoremap <leader>ld <esc>:call ToggleDeadKeys()<CR>a
noremap <leader>li :call ToggleIPA()<CR>
inoremap <leader>li <esc>:call ToggleIPA()<CR>a

"An erotic file-browser
noremap <leader>ev :Lexplore \| set linebreak<CR>
noremap <leader>ee :Explore 
noremap <leader>eo :browse oldfiles \| set linebreak<CR>
noremap <leader>eb 100j
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_winsize=20

"Remove arrow keys
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

"Search
nnoremap <leader>CS :let @/=''<CR>

"Registers
nnoremap <c-y> "*y
inoremap <c-y> "*y

"Terminals
nnoremap <leader>Tt :vsplit term://zsh<CR><c-h><c-l>
nnoremap <leader>TT :split term://zsh<CR><c-k><c-j>
tnoremap <leader><Esc> <C-\><C-n>

"Modules
source ~/.config/nvim/modules/abbrs.vim
source ~/.config/nvim/modules/statusline.vim
source ~/.config/nvim/modules/splits.vim
source ~/.config/nvim/modules/netrw.vim
source ~/.config/nvim/modules/term.vim
source ~/.config/nvim/modules/tabs.vim
source ~/.config/nvim/modules/wiki.vim
source ~/.config/nvim/modules/edit.vim
source ~/.config/nvim/modules/window.vim
source ~/.config/nvim/modules/message.vim
source ~/.config/nvim/modules/openc.vim
source ~/.config/nvim/modules/filetype.vim

"Automatic commands
augroup autocmd
	"greet
	autocmd BufRead *.greet set syntax=greet
	"netrw
	autocmd FileType,WinEnter,BufEnter netrw call Configurenetrw()

	"Get rid of shitty indenting
	autocmd FileType html :normal gg=G

	"Nowrap
	autocmd FileType html :setlocal nowrap

	"C
	autocmd FileType C :noremap <buffer> <leader>end $a;<esc>
	autocmd FileType C :inoremap <buffer> <leader><leader>end <esc>$a;<esc>
augroup END
