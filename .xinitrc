#!/bin/sh

xrdb ~/.local/xres &
setxkbmap haydenh &
xsetroot -cursor_name sailboat &
sxhkd &

exec st -e dwm
