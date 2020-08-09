hb(){
	cp /dev/stdin ~/net/paste/$1
	echo "gopher://haydenvh.com/p/paste/$1" | tee /dev/stderr | xclip
}
