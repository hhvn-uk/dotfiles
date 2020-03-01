all(){
	imagestarbz
	downloadstargz
	documentstargz
	musictarbz
	videostargz
	mailtargz
	securitytargz
	gamestarbz
}

dirclean(){
	rm -rf `find -type d`
}

imagestarbz(){
	tar cjvf images.tar.bz images
}
downloadstargz(){
	tar czvf downloads.tar.gz downloads
}
documentstargz(){
	tar czvf documents.tar.gz documents
}
musictarbz(){
	tar cjvf music.tar.bz music
}
videostarbz(){
	tar cjvf videos.tar.bz videos
}
mailtargz(){
	tar czvf mail.tar.gz mail
}
securitytargz(){
	tar czvf security.tar.gz security
}
gamestarbz(){
	tar czvf games.tar.bz games
}

clean(){
	rm *.tar.*z
}

extract(){
	tar xjvf images.tar.bz
	tar xzvf downloads.tar.gz
	tar xzvf documents.tar.gz
	tar xjvf music.tar.bz
	tar xjvf videos.tar.gz
	tar xzvf mail.tar.gz
	tar xzvf security.tar.gz
	tar xjvf games.tar.gz
}

link(){
	cd ..
	ln -s general/images images
	ln -s general/music music
	ln -s general/videos videos
	ln -s general/images/wallpapers .wallpapers
	ln -s general/mail mail
	ln general/security/pass work/pass
	ln -s general/games/.openttd ./
}

unlink(){
	unlink ../images
	unlink ../music
	unlink ../videos
	unlink ../.wallpapers
	unlink ../mail
}

for func in $(printf "$@")
do
	$func
done
