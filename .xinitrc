#!/bin/rc

host = `{hostname}

xrdb $home/.local/xres &
setxkbmap haydenh &
dwmbar/dwmbar &
$host^/keyboard &
$host^/mount &
xset r rate 200 40 &
xmodmap -e 'keysym Control_R = Multi_key' &
barriers -c $home/.config/barrierc --disable-crypto --no-tray --name port.hhvn.uk &
sxhkd &
st &

$host^/displays # displays must be set up before wallp is run
wallp -r &

while (dwm) {
	true
}

pkill dwmbar
