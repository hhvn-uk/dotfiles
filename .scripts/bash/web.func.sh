#!/bin/bash

hostfile() {
	if [ "$(echo "$1" | sed 's/ /qqq/g' | awk '/qqq/')" == "" ]
	then
		name=$(curl -F "file=@$newfile" http://0x0.st)
		echo "Your file has been hosted at $name"
	else
		newfile=$(echo $1 | tr ' ' '.')
		mv "$1" $newfile
		name=$(curl -F "file=@$newfile" http://0x0.st)
		echo "Your file has been hosted at $name"
		mv $newfile "$1" &&>/dev/null 2>/dev/null 1>/dev/null
	fi
}
rickroll(){
	curl -s -L https://raw.githubusercontent.com/keroseren/rickrollrc/master/roll.sh | bash
}
weather(){
	curl wttr.in/$1
}
iploc(){
	curl ifconfig.co/$1
}
getnews(){
	if [ "$1" != "" ]
	then
		arg=$(echo "$1" | sed 's/ /+/g')
	fi
	curl getnews.tech/$arg
}
cheatsh(){
	curl cheat.sh/$1
}
dict(){
	curl "dict://dict.org/d:$1"
}
parrot(){
	curl parrot.live/$1
}
