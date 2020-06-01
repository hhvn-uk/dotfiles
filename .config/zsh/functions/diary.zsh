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
