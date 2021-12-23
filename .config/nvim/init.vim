"
" .config/nvim/init.vim
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
" vimagit - git in vim
" quickscope - find stuff easer 

"Persistant undo
set undodir=~/.local/share/nvim/undo
set undofile
set undolevels=1000
set undoreload=10000

"Leader
let mapleader=";"
let maplocalleader=","

"Cursor
let &t_SI.="\033[6 q" "SI = INSERT mode
let &t_SR.="\033[4 q" "SR = REPLACE mode
let &t_EI.="\033[2 q" "EI = NORMAL mode (ELSE)

"Tab completion
set path+=**

set encoding=utf-8
set title
syntax on
set termguicolors
colo hhvn
set background=dark
set relativenumber
set number
set hlsearch
filetype plugin on
set noshowmode

function! ReopenFile()
	let curfile=expand('%:p')
	echom curfile
	execute 'write' . curfile
	execute 'edit' . curfile
endfunction

noremap <leader>vs :source ~/.config/nvim/init.vim<CR>
noremap <leader>r :call ReopenFile()<CR>
noremap <leader>m :make
noremap <leader>sc :setlocal spell! spelllang=en_gb \| set linebreak<CR>
noremap <leader>sf mm[s1z=`m<CR>
noremap <leader>ssf mm[sz=`m
noremap <leader>bd :bdelete<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>ss :set syntax=
noremap <leader>8 :set colorcolumn=80<CR>:set tw=80<CR>:set fo+=t<CR>
noremap <leader>g :!git 
noremap <leader>nn :setlocal number! relativenumber!<CR>
noremap <leader>CS :let @/=''<CR>
noremap <silent> <c-s> :silent !plumb <cfile><CR>

nmap <c-o> 0/<++><Enter>"_c4l
imap <c-o> <Esc>0/<++><Enter>"_c4l

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

"Fold
set foldmethod=marker
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Netrw
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

"Registers
set clipboard=unnamed

"Modules
source ~/.config/nvim/modules/statusline.vim
source ~/.config/nvim/modules/splits.vim
source ~/.config/nvim/modules/netrw.vim
source ~/.config/nvim/modules/term.vim
source ~/.config/nvim/modules/message.vim
source ~/.config/nvim/modules/openc.vim
source ~/.config/nvim/modules/filetype.vim
source ~/.config/nvim/modules/textmanipulation.vim

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Shell on BSD
let b:is_posix = 1
