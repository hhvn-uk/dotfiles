#Prompt
function fish_prompt
	tput setaf bold
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
function xi; sudo xbps-install $argv; end
function xq; sudo xbps-query $argv; end
function xr; sudo xbps-remove $argv; end
function irssi; irssi --config ~/.config/irssi/config $argv; end
function pipes; pipes -R -r 10000 -c 10 -c 11 -c 12 -c 13 -c 14 -c 15 -s 15 $argv; end
function clock; tty-clock; end
function ytdl; youtube-dl --add-metadata -ic $argv; end
function ytdla; youtube-dl --add-metadata -xic $argv; end
function ls; command ls --color $argv; end
function map; telnet mapscii.me; end
function tetris; ssh netris.rocketnine.space; end
function calcurse; calcurse -D ~/.config/calcurse/; end
function irssi; command irssi --home ~/.config/irssi/ -n hayden; ircgetpass; end
function xsleep; sudo zzz; end
function xhibernate; sudo ZZZ; end
function urxvtrestart; xrdb ~/.Xresources; xrdb ~/.Xdefaults; end
function rmst; bash ~/.scripts/random/gnulinux.sh; end
function fff; bash ~/.config/fff/config; end
function python; python3; end
function vimb; command vimb --no-maximize; end
function cleancache; sudo xbps-remove -O; end
function dots; git push orgin master; git push github master; end

#Set fish colors
set fish_color_command a84b8d
set fish_color_autosuggestion 86296b
set fish_color_quote 3ab475

#Set LS colors
bash ~/.ls_colors
bash ~/.bash_profile

#Frame buffer
function video; mpv $argv --vo=drm; end
function music; mpv $argv --vo=drm --pause; end

##Auto tar
function at; bash ~/.autotar; end

fish_vi_key_bindings
