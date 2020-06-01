fdalias(){
	alias=$(alias | awk 'BEGIN { FS="=" }; // { print $1 }' | shmenu 'alias')
	echo
	alias $alias
}
