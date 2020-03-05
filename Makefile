all: run

kernel.bin: entry.o kernel.o
	i386-elf-ld -o $@ -Ttext 0x8000 $^ --oformat binary

entry.o: kernel/entry.asm
	nasm $< -f elf -o $@

kernel.o:
	i386-elf-gcc -ffreestanding -c kernel/kernel.c -o kernel.o

# bootloader

boot.bin: boot/boot.asm
	nasm -f bin $< -o $@

os.bin: boot.bin kernel.bin
	cat $^ > $@

run: os.bin
	qemu-system-x86_64 -s os.bin

clean:
	rm *.o boot.bin kernel.bin
