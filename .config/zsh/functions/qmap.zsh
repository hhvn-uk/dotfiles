#!/bin/sh

qmap(){
	sudo nmap -A -T4 -Pn -sS $@ | less
}
