install: build
	install -m0755 blocks/bat bat
	install -m0755 blocks/cpu cpu
	install -m0755 blocks/mem mem
	install -m0755 blocks/vol vol
	install -m0755 blocks/date date
	install -m0755 blocks/time time

build: get
	[ -d blocks ] && { cd blocks; make; } || false

get:
	[ ! -d blocks ] && { git clone git://hhvn.uk/s2dblocks blocks || exit 1; } || true

.PHONY: install build get
