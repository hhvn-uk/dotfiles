#
# .profile
# Created by Hayden Hamilton
#
# haydenvh.com
# Copyright (c) 2019 Hayden Hamilton. LICENSE:GPLv2 ./licenses/gplv2.license
#

export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="C"
export SCRIPTS="$HOME/.scripts/bin"
scripts=$(ls -d $SCRIPTS/*/ | tr '\n' ':')
export PATH="$PATH:$scripts"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="vimb"
export work="$HOME/work"
export WORK="$HOME/work"
export SUDO_ASKPASS="$HOME/.scripts/bin/dmenu/daskpass"
export PASS="$HOME/general/security/pass"
export SHELL="/usr/bin/zsh"
export ZDOTDIR="$HOME/.config/zsh"
. ~/.ls_colors
[ "$hostname" != "" ] && {
	echo > /dev/null
} || [ "$HOSTNAME" != "" ] && {
	export hostname="$HOSTNAME"
} || [ "$(command -v hostname)" != "" ] && {
	export hostname=$(hostname)
} || {
	echo "No built in way to get a hostname..."
};
