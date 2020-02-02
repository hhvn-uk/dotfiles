#!/bin/bash
[ -f .Xresources ] && xrdb -merge .Xresources

while true; do
	dwm
done

#while true; do
#	sowm
#done
