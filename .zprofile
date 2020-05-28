#
# .profile
# Created by Hayden Hamilton
#
# haydenvh.com
# Copyright (c) 2019 Hayden Hamilton. LICENSE:MIT
#

export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="C"
export SCRIPTS="$HOME/.scripts/bin"
scripts=$(ls -d $SCRIPTS/*/ | tr '\n' ':')
export PATH="$PATH:$scripts"
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
. .config/zsh/ls.zsh
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

export LANG=sv_SE.UTF-8
export LC_CTYPE="sv_SE.UTF-8"
export LC_NUMERIC="sv_SE.UTF-8"
export LC_TIME=sv_SE.UTF-8
export LC_COLLATE=sv_SE.UTF-8
export LC_MONETARY="sv_SE.UTF-8"
export LC_MESSAGES="sv_SE.UTF-8"
export LC_PAPER="sv_SE.UTF-8"
export LC_NAME="sv_SE.UTF-8"
export LC_ADDRESS="sv_SE.UTF-8"
export LC_TELEPHONE="sv_SE.UTF-8"
export LC_MEASUREMENT="sv_SE.UTF-8"
export LC_IDENTIFICATION="sv_SE.UTF-8"
export LC_ALL=
