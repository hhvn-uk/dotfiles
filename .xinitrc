#!/bin/rc

xrdb $home/.local/xres &
setxkbmap haydenh &
dwmbar/dwmbar &
port.hhvn.uk/keyboard &
port.hhvn.uk/dock &
port.hhvn.uk/mount &
xset r rate 200 40 &
xmodmap -e 'keysym Control_R = Multi_key' &
barriers -c $home/.config/barrierc --disable-crypto --no-tray --name port.hhvn.uk &
wallp images/wallpapers &

sxhkd &
st &

while (dwm) {
	true
}

pkill dwmbar
