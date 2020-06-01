fdfunc(){
	func=$(find $XDG_CONFIG_HOME/zsh/functions/ -type f | awk 'BEGIN { FS="/" }; // {print $NF}' | sed 's/\.zsh$//g' | shmenu 'function')
	$EDITOR $XDG_CONFIG_HOME/zsh/functions/$func.zsh
}
