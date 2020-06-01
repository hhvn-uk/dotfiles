fdconf(){
	conf=$(find $XDG_CONFIG_HOME -type f | sed "s~^.*$XDG_CONFIG_HOME/~~g" | shmenu 'config')
	$EDITOR $XDG_CONFIG_HOME/$conf
}
