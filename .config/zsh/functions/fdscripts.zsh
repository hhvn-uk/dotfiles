fdscripts(){
	script=$(find ~/.scripts/ -type f | sed "s~^.*\.scripts/~~g" | shmenu scripts)
	$EDITOR ~/.scripts/$script
}
