"
" .config/nvim/init.vim
" Copyright (c) 2019-2022 hhvn <dev@hhvn.uk>
"
"

"GRRRRRR.
set mouse=

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
colo hhvn
set background=dark
set relativenumber
set number
set hlsearch
filetype plugin on
set noshowmode
set so=4
set lcs=tab:._
set gdefault

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
noremap <leader>sf mm[sz=`m
noremap <leader>bd :bdelete<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>8 :set colorcolumn=80<CR>:set tw=80<CR>:set fo+=t<CR>
noremap <leader>g :!git 
noremap <leader>nn :setlocal number! relativenumber!<CR>
noremap <leader>cs :let @/=''<CR>
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

"Remove arrow keys
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

"Use o/O
no A<CR> <Nop>

"Registers
set clipboard=unnamed

"Modules
source ~/.config/nvim/modules/statusline.vim
source ~/.config/nvim/modules/filetype.vim
source ~/.config/nvim/modules/textmanipulation.vim
source ~/.config/nvim/modules/preproccomment.vim

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Shell on BSD
let b:is_posix = 1

" Splitting
set splitbelow splitright
noremap <leader>z :vsplit 
noremap <leader>Z :split 

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c
noremap <A-j> <C-w>+
noremap <A-k> <C-w>-
noremap <A-h> <C-w>>
noremap <A-l> <C-w><

" Hide startup information
set shortmess+=I
