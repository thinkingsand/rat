win: rat.c bin
	${CC} rat.c -o .\bin\rat.exe -Os

win_audio: rat.c loop bin
	${CC} -DAUDIO_EN rat.c .\bin\windows_loop.o -o .\bin\rat.exe -lwinmm

loop:
	windres -i .\audio\windows_loop.rc -o .\bin\windows_loop.o

linux: rat.c bin
	${CC} rat.c -o bin/rat

linux_audio: rat.c linux_loop bin
	${CC} -DAUDIO_EN rat.c audio/linux_audio.c -o bin/rat -lm -lpthread
	
linux_loop:
	xxd -i audio/loop.wav > audio/linux_loop.h

deb:
	${CC} rat.c -o bin/rat -g
	mkdir -p rat_1.0-1/usr/bin
	mkdir -p rat_1.0-1/DEBIAN
	cp bin/rat rat_1.0-1/usr/bin
	cp debian/control rat_1.0-1/DEBIAN
	dpkg-deb --build rat_1.0-1

dos:
	wcl386 rat.c -za99 -d1 -l=dos4g -fe=rat_dos.exe
	del rat.err
	del rat.obj

win95:
	wcl386 rat.c -za99 -d1 -l=win95 -fe=rat_w95.exe
	del rat.err
	del rat.obj
	move rat_w95.exe bin/

watcom_nt:
	wcl386 rat.c -za99 -d1 -l=nt -fe=rat_nt.exe
	del rat.err
	del rat.obj
	move rat_nt.exe bin/

bin:
	mkdir bin

clean:
	rm bin/*
	rm audio/linux_loop.h