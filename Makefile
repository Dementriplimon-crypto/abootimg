
  "app": {
    "version": "7.1.1-MD2V2.1.3",
    "versionCode": "203",
    "link": "https://raw.githubusercontent.com/vsmhell/release/master/app-release.apk",
    "note": "https://raw.githubusercontent.com/vsmhell/release/master/changelog.md"
  },
  "uninstaller": {
    "link": "https://github.com/topjohnwu/Magisk/releases/download/v19.0/Magisk-uninstaller-20190328.zip"
  },
  "magisk": {
    "version": "19.0",
    "versionCode": "19000",
    "link": "https://github.com/topjohnwu/Magisk/releases/download/v19.0/Magisk-v19.0.zip",
    "note": "https://raw.githubusercontent.com/topjohnwu/magisk_files/6378e4404ceb89979d367bcc4687d673aa02c927/notes.md",
    "md5": "e867e1c75d7e93db99a55681e11c02e1"
  },
  "snet": {
    "versionCode": "11",
    "link": "https://raw.githubusercontent.com/topjohnwu/magisk_files/master/snet.apk"
  }
}
CPPFLAGS=-DHAS_BLKID
CFLAGS=-O3 -Wall
LDLIBS=-lblkid

all: abootimg

version.h:
	if [ ! -f version.h ]; then \
	if [ -d .git ]; then \
	echo '#define VERSION_STR "$(shell git describe --tags --abbrev=0)"' > version.h; \
	else \
	echo '#define VERSION_STR ""' > version.h; \
	fi \
	fi

abootimg.o: bootimg.h version.h

clean:
	rm -f abootimg *.o version.h

.PHONY:	clean all

