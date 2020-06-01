newtab(){
	read txid < /tmp/txid
	nohup st -w $txid -e cgo haydenh.null > /dev/null &
}
