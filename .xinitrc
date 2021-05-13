#!/bin/sh

xrdb ~/.local/xres &
setxkbmap haydenh &
mpvlisten /tmp/mpv-socket2 /tmp/mpv-socket &
./.scripts/input/keyboard &
(
	cd .scripts/dwmblocks
	./dwmbar
) &
sxhkd &
cu dock &
cu mount &
cu eyes &
st -e &

#/usr/libexec/xscreensaver/galaxy -root -count 5
#/usr/libexec/xscreensaver/cubicgrid -root -zoom 100 -speed 0.2 &

xset r rate 200 40 &
xmodmap -e "keysym Control_R = Multi_key"

wallp images/ &
while dwm 2>$HOME/.local/dwmlog
do
	:
done
