SOURCE_FILE := kernel.c
OBJ_FILE := kernel.o desc/gdt.o asm.o 8259a/8259a.o
OBJ := vmFinux.core
LD := ld
CC := gcc
LOADER_CFLAGS := -c -g -I ../include/ -Wall -o
LOADER_LDFLAGS := -e kernel_start -Ttext 0x200000 -o

.PHONY: all, clean

all: $(OBJ)
	objcopy -S -O binary vmFinux.kernel $(OBJ)
	cp $(OBJ) ../ -f
	cp vmFinux.kernel ../ -f
	objdump -d vmFinux.kernel > ../obj.S

$(OBJ_FILE): $(SOURCE_FILE)
	$(CC) $(LOADER_CFLAGS) kernel.o kernel.c
	$(CC) $(LOADER_CFLAGS) desc/gdt.o desc/gdt.c
	$(CC) $(LOADER_CFLAGS) asm.o asm.c
	$(CC) $(LOADER_CFLAGS) 8259a/8259a.o 8259a/8259a.c

$(OBJ): $(OBJ_FILE)
	$(LD) $(LOADER_LDFLAGS) vmFinux.kernel $(OBJ_FILE)

clean:
	rm -R -rf *.o *.core */*.o
