#
# .profile
# Created by Hayden Hamilton
#
# haydenvh.com
# Copyright (c) 2019 Hayden Hamilton. LICENSE:GPLv2 ./licenses/gplv2.license
#

export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export SCRIPTS="$HOME/.scripts/bin"
scripts=$(ls -d $SCRIPTS/*/ | tr '\n' ':')
export PATH="$PATH:$scripts"
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="vimb"
export work="$HOME/work"
export WORK="$HOME/work"
export SUDO_ASKPASS="$HOME/.scripts/bin/dmenu/daskpass"
export PASS="$WORK/pass"
export SHELL="/usr/bin/fish"
bash ~/.ls_colors
if [ "$hostname" != "" ]
then
	echo > /dev/null
elif [ "$HOSTNAME" != "" ]
then
	export hostname="$HOSTNAME"
elif [ "$(command -v hostname)" != "" ]
then
	export hostname=$(hostname)
else
	echo "No built in way to get a hostname..."
fi
