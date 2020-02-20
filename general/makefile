tar:
	tar czvf images.tar.gz images
	tar czvf downloads.tar.gz downloads
	tar czvf documents.tar.gz documents
	tar czvf music.tar.gz music
	tar czvf videos.tar.gz videos
	tar czvf mail.tar.gz mail
	tar czvf security.tar.gz security

clean:
	rm *.tar.gz

extract:
	tar xzvf images.tar.gz
	tar xzvf downloads.tar.gz
	tar xzvf documents.tar.gz
	tar xzvf music.tar.gz
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
