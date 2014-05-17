SOURCE_FILE := kernel.c
OBJ_FILE := kernel.o desc/gdt.o asm.o 8259a/8259a.o desc/idt.o interrupt/interrupt.o interrupt/timer.o interrupt/exception.o echo/display.o string.o thread/init.o schedule.o switch.o
OBJ := vmFinux.core
LD := ld
CC := gcc
LOADER_CFLAGS := -c -g -I ../include/ -Wall -o
LOADER_LDFLAGS := -e kernel_start -Ttext 0x200000 -o

AS := as
LOADER_ASFLAGS := -gstabs -o


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
	$(CC) $(LOADER_CFLAGS) desc/idt.o desc/idt.c
#	$(CC) $(LOADER_CFLAGS) interrupt/interrupt.o interrupt/interrupt.c
	$(CC) $(LOADER_CFLAGS) interrupt/timer.o interrupt/timer.c
	$(CC) $(LOADER_CFLAGS) interrupt/exception.o interrupt/exception.c
	$(CC) $(LOADER_CFLAGS) echo/display.o echo/display.c
	$(CC) $(LOADER_CFLAGS) string.o ../lib/string.c
	$(CC) $(LOADER_CFLAGS) thread/init.o thread/init.c
	$(CC) $(LOADER_CFLAGS) schedule.o schedule.c
####
	$(AS) $(LOADER_ASFLAGS) interrupt/interrupt.o interrupt/interrupt.S
	$(AS) $(LOADER_ASFLAGS) switch.o switch.S

$(OBJ): $(OBJ_FILE)
	$(LD) $(LOADER_LDFLAGS) vmFinux.kernel $(OBJ_FILE)

clean:
	rm -R -rf *.o *.core */*.o *.kernel
