#!/bin/ksh

set vi
export      PS1="$(tput setaf 5)$(whoami)$(tput setaf 7) \$$(tput sgr0) "
export PS2="$(whoami | tr '[:alnum:]' ' ')$(tput setaf 7) |$(tput sgr0) " 
export PS3="$(whoami | tr '[:alnum:]' ' ')$(tput setaf 7) |$(tput sgr0) " 
export PS4="$(whoami | tr '[:alnum:]' ' ')$(tput setaf 7) |$(tput sgr0) " 

for f in $HOME/.config/ksh/*
do
	. $f
done
