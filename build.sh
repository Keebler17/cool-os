rm boot.bin
nasm -f bin boot/boot.asm -o boot.bin
nasm -f elf kernel/entry.asm -o entry.o
i386-elf-gcc -ffreestanding -c kernel/kernel.c -o kernel.o
i386-elf-ld -o kernel.bin -Ttext 0x8000 entry.o kernel.o --oformat binary
cat boot.bin kernel.bin > os.bin
qemu-system-i386 -s os.bin
