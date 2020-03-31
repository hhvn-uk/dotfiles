#!/bin/bash

xrdb ~/.local/xres &
setxkbmap haydenh &
xsetroot -cursor_name sailboat &
sxhkd &
sh ~/.scripts/custom/* &

while true; do
	dwm
done

#while true; do
#	sowm
#done
