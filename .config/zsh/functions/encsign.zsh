encsign(){
	[ "$1" = "--help" ] && echo '$1=recipient $2=file' && exit 1
	gpg --encrypt --sign --armor -r $1 $2
}
