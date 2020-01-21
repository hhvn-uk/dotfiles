#Prompt
function fish_prompt
	set STRING (pwd | sed "s~$HOME~\~~g" | tr "/" "\n" | cut -c 1-3 | tr "\n" "/")
	tput setaf 2
	printf "["
	tput setaf 3
	printf $USER
	tput setaf 4
	printf "@"
	tput setaf 5
	printf $hostname
	tput setaf 6
	printf " "$STRING
	tput setaf 2
	printf "]"
	tput setaf 11
	printf "\$ "
end

#Aliases
abbr -a -g vi vim $argv
abbr -a -g xi sudo xbps-install
abbr -a -g xq sudo xbps-query
abbr -a -g xr sudo xbps-remove
abbr -a -g irssi irssi --config ~/.config/irssi/config
abbr -a -g pipes pipes -R -r 10000 -c 10 -c 11 -c 12 -c 13 -c 14 -c 15 -s 15 $argv
abbr -a -g clock tty-clock
abbr -a -g ytdl youtube-dl --add-metadata -ic
abbr -a -g ytdla youtube-dl --add-metadata -xic
abbr -a -g ls ls --color
abbr -a -g map telnet mapscii.me
abbr -a -g tetris ssh netris.rocketnine.space
abbr -a -g calcurse calcurse -D ~/.config/calcurse/
abbr -a -g irssi  irssi --home ~/.config/irssi/ -n haydenh
abbr -a -g sleep sudo zzz
abbr -a -g hibernate sudo ZZZ
abbr -a -g rmst bash ~/.scripts/random/gnulinux.sh
abbr -a -g fff bash ~/.config/fff/config
abbr -a -g python python3
abbr -a -g vimb vimb --no-maximize
abbr -a -g cleancache sudo xbps-remove -O
abbr -a -g clock tty-clock -s -c -C 7

#Set fish colors
set fish_color_command a84b8d
set fish_color_autosuggestion 86296b
set fish_color_quote 3ab475

#Set LS colors
set -x LS_COLORS "di=35:fi=0:ln=33:ex=91;01:*.sh=91:*.html=92:*.css=97:*.md=97:*.yml=93:*.c=94:*.h=94:*.h.orig=94;01:*.h.rej=94;01:*.mk=96:*LICENSE=90:*Makefile=90:*README=97:*.c.orig=94;01:*.c.rej=94;01:*.png=95:*.jpg=95:*.heic=95:*.heif=95:*.mp3=95;01:*opus=.95;01:*.m4a=95;01:*.flac=95;01:*.wav=95;01:*.mp4=95;04:*.mkv=95;04"


#Frame buffer
abbr -a -g video mpv $argv --vo=drm
abbr -a -g music mpv $argv --vo=drm --pause

fish_vi_key_bindings

function hostfile
		set name (curl -F "file=@$argv" http://0x0.st)
		echo "Your file has been hosted at $name"
end
