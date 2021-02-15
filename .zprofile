#!/bin/ksh

export ENV="$HOME/.config/ksh/kshrc"
export EDITOR="nvim"
export PAGER="less"
export TERMINAL="st"
export BROWSER="vimb"
export work="$HOME/work"
export WORK="$HOME/work"
export SUDO_ASKPASS="$HOME/.scripts/bin/dmenu/daskpass"
export PASS="$HOME/.local/pass"
export SHELL="/usr/bin/zsh"
export ZDOTDIR="$HOME/.config/zsh"
export CURLHOME="$HOME/.config/curl/"
export CC="tcc"
[ "$hostname" != "" ] && {
	echo > /dev/null
} || [ "$HOSTNAME" != "" ] && {
	export hostname="$HOSTNAME"
} || [ "$(command -v hostname)" != "" ] && {
	export hostname=$(hostname)
} || {
	echo "No built in way to get a hostname..."
};

#XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_DIRS=/usr/local/share:/usr/share:$HOME/.local/share
export XAUTHORITY=$HOME/.local/.xauth
export LESSHISTFILE=-
export GNUPGHOME=$HOME/.local/gnupg

cd $HOME # welcome home (st inherits / from hildon)

[ "$(basename $SHELL)" != "ksh" ] && export SHELL=/bin/ksh && ksh
