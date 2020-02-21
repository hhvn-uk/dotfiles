tar:
	tar cjvf images.tar.bz images
	tar czvf downloads.tar.gz downloads
	tar czvf documents.tar.gz documents
	tar cjvf music.tar.bz music
	tar cjvf videos.tar.gz videos
	tar czvf mail.tar.gz mail
	tar czvf security.tar.gz security

images:
	tar cjvf images.tar.bz images
downloads:
	tar czvf downloads.tar.gz downloads
documents:
	tar czvf documents.tar.gz documents
music:
	tar cjvf music.tar.bz music
videos:
	tar cjvf videos.tar.bz videos

clean:
	rm *.tar.*z

extract:
	tar xjvf images.tar.bz
	tar xzvf downloads.tar.gz
	tar xzvf documents.tar.gz
	tar xjvf music.tar.bz
	tar xzvf videos.tar.gz
	tar xzvf mail.tar.gz
	tar xzvf security.tar.gz

link:
	cd ..
	ln -s general/images images
	ln -s general/music music
	ln -s general/videos videos
	ln -s general/images/wallpapers .wallpapers
	ln -s general/mail mail
	ln general/security/pass work/pass

unlink:
	unlink ../images
	unlink ../music
	unlink ../videos
	unlink ../.wallpapers
	unlink ../mail
