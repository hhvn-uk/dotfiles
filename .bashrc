#
# .bashrc
# Created by Hayden Hamilton
#
# haydenvh.com
# Copyright (c) 2019 Hayden Hamilton. LICENSE:GPLv2 ./licenses/gplv2.license
#

##Infinite command history
HISTSIZE= HISTFILESIZE=
##Setting promt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\\$ \[$(tput sgr0)\]"
export PS2="\[$(tput bold)\]\[$(tput setaf 1)\][$(tput setaf 2)\]Unclosed string\[$(tput setaf 1)\]]\[$(tput setaf 7)\]> \[$(tput sgr0)\]"

##Setting aliases for xbps
alias \
vi="vim" \
xi="sudo xbps-install" \
xq="sudo xbps-query" \
xr="sudo xbps-remove" \
irssi="irssi --config ~/.config/irssi/config" \
pipes="pipes -R -r 10000 -c 10 -c 11 -c 12 -c 13 -c 14 -c 15 -s 15" \
clock="tty-clock" \
ytdl="youtube-dl --add-metadata -ic" \
ytdla="youtube-dl --add-metadata -xic" \
ls="ls --color" \
map="telnet mapscii.me" \
tetris="ssh netris.rocketnine.space" \
calcurse="calcurse -D ~/.config/calcurse/" \
irssi="irssi --home ~/.config/irssi/ -n haydenh" \
trimwhite="for f in *; do mv "$f" `echo $f | tr ' ' '.'`; done" \
xsleep="sudo zzz" \
xhibernate="sudo ZZZ" \
urxvtrestart="xrdb ~/.Xdefaults;xrdb ~/.Xresources" \
rmst="bash ~/.scripts/random/gnulinux.sh" \
?="sudo !!" \
fff="ffflaunch" \
python="python3" \
gcc="gcc -Wall" \
gpp="g++ -Wall" \
fb="mpv --vo=drm" \
vimb="vimb --no-maximize" \

##Setting VI mode
set -o vi

##Setting colors for ls
export LS_COLORS="di=35:fi=0:ln=33:ex=91;01:*.sh=91:*.html=92:*.css=97:*.md=97:*.yml=93:*.c=94:*.h=94:*.h.orig=94;01:*.h.rej=94;01:*.mk=96:*LICENSE=90:*Makefile=90:*README=97:*.c.orig=94;01:*.c.rej=94;01:*.png=95:*.jpg=95:*.heic=95:*.heif=95:*.mp3=95;01:*opus=.95;01:*.m4a=95;01:*.flac=95;01:*.wav=95;01:*.mp4=95;04:*.mkv=95;04"

##Framebuffer functions
video(){
	mpv $* --vo=drm
}
image(){
	mpv $* --vo=drm --pause
}

##C Compilation
comp(){
	out="$1"
	gcc $2 $3 $4 $5 $6 $7 $8 $9 -o ~/.scripts/bin/c/"$out"
}

##Random
hostfile() {
	if [ "$(echo "$1" | sed 's/ /qqq/g' | awk '/qqq/')" == "" ]
	then
		name=$(curl -F "file=@$1" http://0x0.st)
		echo "Your file has been hosted at $name"
	else
		newfile=$(echo $1 | tr ' ' '.')
		mv "$1" $newfile
		name=$(curl -F "file=@$newfile" http://0x0.st)
		echo "Your file has been hosted at $name"
		mv $newfile "$1" &&>/dev/null 2>/dev/null 1>/dev/null
	fi
}
rickroll(){
	curl -s -L https://raw.githubusercontent.com/keroseren/rickrollrc/master/roll.sh | bash
}
weather(){
	curl wttr.in/$1
}
iploc(){
	curl ifconfig.co/$1
}
getnews(){
	if [ "$1" != "" ]
	then
		arg=$(echo "$1" | sed 's/ /+/g')
	fi
	curl getnews.tech/$arg
}
cheatsh(){
	curl cheat.sh/$1
}
dict(){
	curl "dict://dict.org/d:$1"
}
parrot(){
	curl parrot.live/$1
}
bash ~/.bash_profile
