OBJ_FILE := e820.s
OBJ_BIN := boot.o
OBJ := boot.bin
IMG := boot.img

AS := as
BOOT_ASFLAGS := -o
LD := ld

BOOT_LDFLAGS := -e _start -Ttext 0x7c00 -o
#BOOT_LDFLAGS := -e _start  -o

.PHONY : all clean

all: $(IMG)
	echo "ok..."

$(OBJ_BIN): $(OBJ_FILE)
	$(AS) $(BOOT_ASFLAGS) $@ $<

$(IMG) $(OBJ): $(OBJ_BIN)
	$(LD) $(BOOT_LDFLAGS) $(OBJ) $(OBJ_BIN)
	objcopy -S -O binary $(OBJ) $(IMG)

clean:
	rm -rf *.img *.bin *.o
