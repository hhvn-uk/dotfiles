"
" .bashrc
" Created by Hayden Hamilton
"
" haydenvh.com
" Copyright (c) 2019 Hayden Hamilton. LICENSE:GPLv2 ./licenses/gplv2.license
"

"VI-M not VI
set nocompatible

"Leader
let mapleader=","

"Manpage
let $PAGER=''

"Tab completion
set path+=**
set wildmenu
set wildmode=longest,list,full
set incsearch

"Set colourscheme
syntax on
set background=dark
set relativenumber
set number
set hlsearch

"Remove arrow keys
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>
