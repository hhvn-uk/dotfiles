"
" .bashrc
" Created by Hayden Hamilton
"
" haydenvh.com
" Copyright (c) 2019 Hayden Hamilton.
"

"Note: scripts are found in .vim/plugin/ or .vim/autoload/
" goyo - centres text
" surround - allows operation on surrounding characters
" commentary - comments stuff out
" repeat - repeat things
" vimling (ipa, deadkeys, prose) - deadkeys

"VI-M not VI
set nocompatible

"Leader
let mapleader=","

"Tab completion
set path+=**
set wildmenu
set wildmode=longest,list,full
set incsearch

"Misc
set encoding=utf-8

"Set scheme
syntax on
colo ron
set background=dark
set relativenumber
set number
set hlsearch
filetype plugin on

"Keys
map <leader>g :Goyo \| set linebreak<CR>
map <leader>c :!sudo make all install clean \| set linebreak<CR>
map <leader>oc :!groff -T pdf % - > /tmp/grff<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
map <Leader>ov :!zathura /tmp/grff \| set linebreak<CR>
map <Leader>sv :!sent % \| set linebreak<CR> 
map <leader>sc :setlocal spell! spelllang=en_us \| set linebreak<CR>
map <leader>ff :r !find \| set linebreak<CR>
map <leader>fl :r !ls \| set linebreak<CR>
map <leader>bd :bdelete \| set linebreak<CR>
map <leader>bn :bn \| set linebreak<CR>
map <leader>bp :bp \| set linebreak<CR>
map <leader>mvg :r !find -maxdepth 1 -type f -printf "mv \"\%f\"\t<++>\n"<Enter>
map <leader>mvd :w! /tmp/bmv-edit \| set linebreak<CR>:!sh /tmp/bmv-edit \| set linebreak<CR>:q \| set linebreak<CR>
map <leader>ss :set syntax=
map dw diw
map cw ciw
imap <leader><leader>ss <Esc>:set syntax=

map <leader>j 0/<++><Enter>"_c4l
map <leader>J 0/<++><Enter>"_d4l
imap <leader><leader>j <Esc>0/<++><Enter>"_c4l
map <leader>C i<++><Esc>
imap <leader><leader>c <++><Enter>

map <leader><leader>[ []<Esc><Left>i
map <leader><leader>( ()<Esc><Left>i
map <leader><leader>" ""<Esc><Left>i
map <leader><leader>' ''<Esc><Left>i
map <leader><leader>{ {}<Esc><Left>i
map <leader><leader>< <><Esc><Left>i
imap <leader><leader>[ []<Esc><Left>i
imap <leader><leader>( ()<Esc><Left>i
imap <leader><leader>" ""<Esc><Left>i
imap <leader><leader>' ''<Esc><Left>i
imap <leader><leader>{ {}<Esc><Left>i
imap <leader><leader>< <><Esc><Left>i

"Magit
map <leader>m :Magit \| set linebreak<CR>
let g:magit_default_fold_level=0

"Splits
set splitbelow splitright
noremap <leader>z :vsplit \| set linebreak<CR>
noremap <leader>Z :split \| set linebreak<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c

"Vimling
nm <leader>ld :call ToggleDeadKeys()<CR>
imap <leader>ld <esc>:call ToggleDeadKeys()<CR>a
nm <leader>li :call ToggleIPA()<CR>
imap <leader>li <esc>:call ToggleIPA()<CR>a
nm <F8> :call ToggleProse()<CR>

"File-browser
map <leader>eh :Sexplore \| set linebreak<CR>
map <leader>ev :Vexplore \| set linebreak<CR>
map <leader>en :Explox \| set linebreak<CR>
map <leader>Eo :browse oldfiles \| set linebreak<CR>
map <leader>Eb 100j
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_altv=1

"Remove arrow keys
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>
