#Prompt
function fish_prompt
	tput setaf 2
	printf "["
	tput setaf 3
	printf $USER
	tput setaf 4
	printf "@"
	tput setaf 5
	printf $hostname
	tput setaf 6
	printf " "(pwd | sed "s~$HOME~\~~g")
	tput setaf 2
	printf "]"
	tput setaf 11
	printf "\$ "
end

#Aliases
function vi; vim $argv; end
function xi; sudo xbps-install $argv; cleancache; end
function xq; sudo xbps-query $argv; cleancache; end
function xr; sudo xbps-remove $argv; cleancache; end
function irssi; irssi --config ~/.config/irssi/config $argv; end
function pipes; command pipes -R -r 10000 -c 10 -c 11 -c 12 -c 13 -c 14 -c 15 -s 15 $argv; end
function clock; tty-clock; end
function ytdl; youtube-dl --add-metadata -ic $argv; end
function ytdla; youtube-dl --add-metadata -xic $argv; end
function ls; command ls --color $argv; end
function map; telnet mapscii.me; end
function tetris; ssh netris.rocketnine.space; end
function calcurse; command calcurse -D ~/.config/calcurse/; end
function irssi; command irssi --home ~/.config/irssi/ -n hayden; ircgetpass; end
function sleep; sudo zzz; end
function hibernate; sudo ZZZ; end
function urxvtrestart; xrdb -merge ~/.Xdefaults; xrdb -merge ~/.Xresources; exec urxvtc; end
function rmst; bash ~/.scripts/random/gnulinux.sh; end
function fff; bash ~/.config/fff/config; end
function python; python3; end
function vimb; command vimb --no-maximize; end
function cleancache; sudo xbps-remove -O; end
function dots; git push origin master -f; git push github master -f; end
function dotsadd; bash ~/.gitaddlist; end

#Set fish colors
set fish_color_command a84b8d
set fish_color_autosuggestion 86296b
set fish_color_quote 3ab475

#Set LS colors
set -x LS_COLORS "di=35:fi=0:ln=33:ex=91;01:*.sh=91:*.html=92:*.css=97:*.md=97:*.yml=93:*.c=94:*.h=94:*.h.orig=94;01:*.h.rej=94;01:*.mk=96:*LICENSE=90:*Makefile=90:*README=97:*.c.orig=94;01:*.c.rej=94;01:*.png=95:*.jpg=95:*.heic=95:*.heif=95:*.mp3=95;01:*opus=.95;01:*.m4a=95;01:*.flac=95;01:*.wav=95;01:*.mp4=95;04:*.mkv=95;04"


#Frame buffer
function video; mpv $argv --vo=drm; end
function music; mpv $argv --vo=drm --pause; end

##Auto tar
function at; bash ~/.autotar; end

fish_vi_key_bindings
