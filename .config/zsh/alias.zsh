alias -g ...=" ../.."
alias -g ....=" ../../.."
alias -g .....=" ../../../.."
alias -g ......=" ../../../../.."
alias -g .......=" ../../../../../.."
alias -g ........=" ../../../../../../.."
alias -g .........=" ../../../../../../../.."
alias -g ..........=" ../../../../../../../../.."
alias -g ...........=" ../../../../../../../../../.."
alias -g ............=" ../../../../../../../../../../.."
alias -g om=" origin master"
alias -g gm=" github master"
alias -g aic=" all install clean"
alias vsplit=" vim -O"
alias split=" vim -o"
alias l=" \ls --color=auto -Fh"
alias ls=" \ls --color=auto"
alias d=" \ls --color=auto -FCash"
alias la=" \ls --color=auto -FAh"
alias ll=" \ls --color=auto -Flh"
alias lla=" \ls --color=auto -FlAh"
alias r=" \rm"
alias rr=" \rm -rf"
alias v=" nvim"
alias g=" \git"
alias c=" \clear"
alias f=" \find"
alias xi=" sudo xbps-install"
alias xiu=" sudo xbps-install -S; sudo xbps-install -yu xbps; sudo xbps-install -yu; sudo xbps-remove -Ooy; rm -rf ~/.cache ~/.mozilla ~/.local/share/webkitgtk ~/.viminfo ~/.wget-hsts ~/.lesshst ~/.sh_history ~/.python_history ~/.*history ~/.*hst* ~/.dbus ~/.w3m ~/.config/vimb/cookies.db; sudo vkpurge rm all"
alias xq=" sudo xbps-query"
alias xr=" sudo xbps-remove"
alias wget=" \wget --hsts-file="/dev/null""
alias pipes=" \pipes -R -r 10000 -c 10 -c 11 -c 12 -c 13 -c 14 -c 15 -s 15"
alias clock=" tty-clock -s -c -C 7"
alias ytdl=" youtube-dl --add-metadata -ic"
alias ytdla=" youtube-dl --add-metadata -xic"
alias map=" telnet mapscii.me"
alias irssi=" \irssi --home ~/.config/irssi/ -n haydenh"
alias zsleep=" sudo zzz"
alias hibernate=" sudo ZZZ"
alias rmst=" bash ~/.scripts/random/gnulinux.sh"
alias vimb=" \vimb --no-maximize"
alias mkconfall=" mkmailpass; mkalias"
alias make=" \make CC=tcc"
alias nm=" export ESCDELAY=5 ; neomutt ; rm /tmp/mail ; rm /tmp/blocks/mail ; rm /tmp/dwmblocks/mail ; rm /tmp/blocks/mail ; rm /tmp/dwmblocks/mail"
alias maic=" sudo make install clean"
alias homesync=" rsync --port 22 --delete -azPe 'ssh -p 222' --exclude=general --exclude=.cache --exclude=.local/cache $HOME/ void@192.168.1.20:/home/void/homedir/"
alias tmux=" \tmux -f $HOME/.config/tmux/config"
alias notes=" vim ~/.local/notes"
alias fwknop=" fwknop --rc-file=$HOME/.config/fwknop/config --save-args-file=/dev/full"
alias edconf=" nvim ~/.config/zsh/.zshrc"
alias gnu.matrix=" fwknop --rc-file=$HOME/.config/fwknop/config --save-args-file=/dev/full -sn gnu.matrix && ssh gnu.matrix"
alias rss=" sfeed_update $XDG_CONFIG_HOME/sfeed/config && . $XDG_CONFIG_HOME/sfeed/config && sfeed_curses $XDG_CACHE_HOME/sfeed/*"
alias diff=" colordiff"
alias irc=" (sleep 1 && xdotool type 'tmux a' && xdotool key Return) & ssh local"
alias cgo=" rlwrap cgo"
alias ~d=" cd ~/general/downloads; ls"
alias ~do=" cd ~/general/documents; ls"
alias ~iw=" cd ~/images/wallpapers; ls"
alias ~i=" cd ~/images; ls"
alias ~v=" cd ~/videos; ls"
alias ~m=" cd ~/music; ls"
alias ~w=" cd ~/work; ls"
alias ~c=" cd ~/.config; ls"
alias ~s=" cd ~/.scripts; ls"
alias ~sb=" cd ~/.scripts/bin; ls"
alias ~sbdi=" cd ~/.scripts/bin/display; ls"
alias ~sbdm=" cd ~/.scripts/bin/dmenu; ls"
alias ~sbi=" cd ~/.scripts/bin/i3; ls"
alias ~sbm=" cd ~/.scripts/bin/misc; ls"
alias ~=" cd"
alias ..=" cd .."
alias ...=" cd ../.."
alias ....=" cd ../../.."
alias .....=" cd ../../../.."
alias ......=" cd ../../../../.."
alias .......=" cd ../../../../../.."
alias ........=" cd ../../../../../../.."
alias .........=" cd ../../../../../../../.."
alias ..........=" cd ../../../../../../../../.."
alias ...........=" cd ../../../../../../../../../.."
alias ............=" cd ../../../../../../../../../../.."
