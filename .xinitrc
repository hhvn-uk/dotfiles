#!/bin/rc

xrdb $home/.local/xres &
setxkbmap haydenh &
dwmbar/dwmbar &
port.hhvn.uk/keyboard &
port.hhvn.uk/dock &
port.hhvn.uk/mount &
xset r rate 200 40 &
xmodmap -e 'keysym Control_R = Multi_key' &
wallp images/wallpapers &

SHELL = /bin/sh 
sxhkd &
st &

while (dwm) {
	true
}

pkill dwmbar
