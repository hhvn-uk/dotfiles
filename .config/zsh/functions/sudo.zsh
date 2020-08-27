sudo(){
	[ -z $1 ] && /bin/doas $SHELL || /bin/doas $@
}

doas(){
	[ -z $1 ] && /bin/doas $SHELL || /bin/doas $@
}
