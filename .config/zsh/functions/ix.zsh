ix(){
	curl -n -F "f:1=<-" http://ix.io < /dev/stdin | tee /dev/stderr | xclip
}
