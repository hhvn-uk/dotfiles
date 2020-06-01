0x0(){
	curl -n -F "file=@/dev/stdin" https://0x0.st < /dev/stdin | tee /dev/stderr | xclip
}
