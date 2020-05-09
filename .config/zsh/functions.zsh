0x0(){
	curl -n -F "file=<-" http://0x0.st < /dev/stdin | tee /dev/stderr | xclip
}

ix(){
	curl -n -F "f:1=<-" http://ix.io < /dev/stdin | tee /dev/stderr | xclip
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

notebook(){
	nvim $HOME/.local/notes
}

diary(){
	for o in "public" "private"
	do
		echo "===$o===" > ~/.local/${o}d
	done

	phlog="$HOME/web/alcl/write"
	mkdir -p $phlog/daily.accomplishments ~/.local/diary
	vim -O ~/.local/publicd ~/.local/privated
	date=$(date +%d%m%y)
	printf '.txt or .gph?'; read ftype < /dev/tty
	mv ~/.local/publicd $phlog/daily.accomplishments/Accomplishments.of.$date.$ftype
	mv ~/.local/privated ~/.local/diary/$date
}
