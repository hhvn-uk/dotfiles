#!/bin/sh
killprog(){
	for prog in $(printf "$@")
	do
		pkill $prog
	done
}

0x0(){
	for file in $(printf "$@")
	do
		name=$(curl -n -F "file=@$file" http://0x0.st)
		echo "$file : $name"
		names="$names $name"
	done
	echo $names | xclip
}

ix(){
	for file in $(printf "$@")
	do
		name=$(curl -n -F "f:1=<-" http://ix.io < $file)
		echo "$file : $name"
		names="$names $name"
	done
	echo $names | xclip
}

pc(){
	"$@" | curl -n -F "f:1=<-" http://ix.io
}

make(){
	[ -f make.sh ] && {
		sh make.sh "$@"
	} || {
		command make "$@"
	}
}

man(){
	cols=$(tput cols)
	[ "$cols" -gt "120" ] && export MANWIDTH=120
	[ "$cols" -lt "120" ] && export MANWIDTH=$cols
	command man -c "$@" | centre
}

colo(){
	for file in $(printf "$@")
	do
		name=$(curl -n -F "image=@$file" https://api.deepai.org/api/colorizer)
		echo "$file : $name"
		names="$names $name"
	done
	echo $names | xclip
}

colotable(){
	o=0
	for ((i=0;i<256;i++))
	do
		[ $o -gt 5 ] && printf "\n" && o=0
		o=$(($o+1))
		tput setaf $i
		printf "  %03d  " "$i"
		tput setab $i
		printf "       "
		tput sgr0
	done
}
