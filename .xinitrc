#!/bin/sh

xrdb ~/.local/xres &
setxkbmap haydenh &
mpvlisten /tmp/mpv-socket2 /tmp/mpv-socket &
./.scripts/input/keyboard &
redshift &
(
	cd .scripts/dwmblocks
	./dwmbar
) &
sxhkd &
cu dock &
cu mount &
st -e &

#/usr/libexec/xscreensaver/galaxy -root -count 5
#/usr/libexec/xscreensaver/cubicgrid -root -zoom 100 -speed 0.2 &

wallp images/ &

while dwm 2>$HOME/.local/dwmlog
do
	:
done
