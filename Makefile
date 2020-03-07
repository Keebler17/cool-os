C_SOURCES = $(wildcard *.c)
C_HEADERS = $(wildcard *.h)

OBJ = ${C_SOURCES:.c=.o}

CC = $HOME/opt/cross/bin/i386-elf-gcc

CFLAGS = -g

os.bin: boot.bin kernel.bin
	cat $^ > $@

# link together

kernel.bin: entry.o ${OBJ}
	i386-elf-ld -o $@ -Ttext 0x8000 $^ --oformat binary


# compiling

%.o: %.c ${HEADERS}
	nasm ${CC} -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@
# running

run: os.bin
	qemu-system-x86_64 -s os.bin

clean:
	mv os.bin os.bin.0
	rm *.o *.bin
	mv os.bin.0 os.bin
