0x0(){
	curl -n -F "file=@/dev/stdin" https://0x0.st < /dev/stdin | tee /dev/stderr | xclip
}

ix(){
	curl -n -F "f:1=<-" http://ix.io < /dev/stdin | tee /dev/stderr | xclip
}

yt(){
	cgo "haydenh.null/7/exec/idiot/youtube/gopher.dcgi"
}

me0w(){
	echo "gopher://me0w.net/0/pit/$(nc me0w.net 31415 < /dev/stdin)" | tee /dev/stderr |xclip
}

hb(){
	nc haydenh.null 9999 < /dev/stdin | tee /dev/stderr | xclip
}

colotable(){
	o=0
	for ((i=0;i<256;i++))
	do
		[ $o -gt 5 ] && printf "\n" && o=0
		o=$(($o+1))
		tput setaf $i
		printf "  %03d  " "$i"
		tput setab $i
		printf "       "
		tput sgr0
	done
}

encsign(){
	[ "$1" = "--help" ] && echo '$1=recipient $2=file' && exit 1
	gpg --encrypt --sign --armor -r $1 $2
}

cu(){
	sh $HOME/.scripts/custom/$1
}

radio(){
	mpv $1 --input-ipc-server=/tmp/mpv-socket3
}

diary(){
	date=$(date +%d%m%y)
	wdate=$(date +%d/%m/%y)
	echo "===private===" > ~/.local/privated
	echo "#Daily Entry - $wdate" > ~/.local/public.gph

	phlog="$HOME/net/alcl/write"
	mkdir -p $phlog/daily.entries ~/.local/diary
	vim -O ~/.local/public.gph ~/.local/privated
	printf '.txt or .gph?'; read ftype < /dev/tty
	mv ~/.local/public.gph $phlog/daily.entries/entry.of.$date.$ftype
	mv ~/.local/privated ~/.local/diary/$date
}

sttab(){
	nohup tabbed st -w > /tmp/txid &
}

newtab(){
	read txid < /tmp/txid
	nohup st -w $txid -e cgo haydenh.null > /dev/null &
}
