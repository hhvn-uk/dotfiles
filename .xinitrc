!/bin/sh

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
st -e &

#/usr/libexec/xscreensaver/galaxy -root -count 5
#/usr/libexec/xscreensaver/cubicgrid -root -zoom 100 -speed 0.2 &

rfeh images/

while true; do
	dwm 2>log
done
