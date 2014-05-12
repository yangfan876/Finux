SOURCE_FILE := kernel.c
OBJ_FILE := kernel.o
OBJ := vmFinux.core
LD := ld
CC := gcc
LOADER_CFLAGS := -c -g -I ../include/ -Wall -o
LOADER_LDFLAGS := -e kernel_start -Ttext 0x200000 -o

.PHONY: all, clean

all: $(OBJ)
	objcopy -S -O binary vmFinux.kernel $(OBJ)
	cp $(OBJ) ../ -f

$(OBJ_FILE): $(SOURCE_FILE)
	$(CC) $(LOADER_CFLAGS) kernel.o kernel.c

$(OBJ): $(OBJ_FILE)
	$(LD) $(LOADER_LDFLAGS) vmFinux.kernel $(OBJ_FILE)

clean:
	rm -rf *.o *.core
