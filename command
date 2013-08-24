编译指令
as -a -o boot.o boot.s
链接指令
ld -nostdlib -static -N -e start -Ttext 0x7c00 -o boot.out boot.o
最后的生成指令
objcopy -S -O binary boot boot.out
