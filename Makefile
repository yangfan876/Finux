.PHONY : install, remove, all, kernel

all:
	@echo "plase add the command, such as 'install, remove. etc'"
install:
	cd kernel && make -f Makefile
	cp -f test/hd.hdimg ./hd.hdimg
	python finux_tool/finux.py ./hd.hdimg cp vmFinux.core

remove:
	rm -rf ./hd.hdimg
	rm -rf ./vmFinux.*
	cp test/hd.hdimg ./

kernel:
	cd kernel && make -f Makefile
debug-qemu:
	qemu-system-i386 -S -m 32 -fda ./b.floppy -hda ./hd.hdimg -boot order=a -D ./qemu.log -gdb tcp::1234

qemu-run:
	qemu-system-i386 -m 32 -fda ./b.floppy -hda ./hd.hdimg -boot order=a

debug-bochs:
	bochs -q

