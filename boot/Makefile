OBJ_FILE := boot.s
OBJ_BIN := boot.o
OBJ := boot.bin
IMG := boot.img
DISK := ../b.floppy
AS := as
BOOT_ASFLAGS := -gstabs -o
LD := ld
BOOT_LDFLAGS := -e _start -Ttext 0x7c00 -o

.PHONY : all clean

all: $(IMG)
	make -f Makefile.loader
	echo "ok..."
	objdump -d loader > obj.s

$(OBJ_BIN): $(OBJ_FILE)
	$(AS) $(BOOT_ASFLAGS) $@ $<

$(OBJ): $(OBJ_BIN)
	$(LD) $(BOOT_LDFLAGS) $@ $<

$(IMG): $(OBJ)
	objcopy -S -O binary $(OBJ) $(IMG)
	dd if=$(IMG) of=$(DISK) bs=512 count=1 conv=notrunc


clean:
	rm -rf *.img *.bin *.o loader
debug-bochs:
	bochs -q
debug-qemu:
	qemu-system-i386 -S -m 32 -fda ../b.floppy -hda ../hd.hdimg -boot order=a
qemu-run:
	qemu-system-i386 -m 32 -fda ../b.floppy -hda ../hd.hdimg -boot order=a
