rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d)) # found this on stackoverflow lol

C_SOURCES = $(call rwildcard,., *.c)
C_HEADERS = $(call rwildcard,., *.h)

OBJ = ${C_SOURCES:.c=.o}

CC = ~/opt/cross-i386/bin/i386-elf-gcc

CFLAGS = -g

run: os.bin
	qemu-system-x86_64 -s $<

os.bin: boot/boot.bin kernel.bin
	cat $^ > $@

# link togethers

kernel.bin: kernel/entry.o ${OBJ}
	i386-elf-ld -o $@ -Ttext 0x8000 $^ --oformat binary

# wildcards

%.o: %.c {HEADERS}
	${CC} ${CFLAGS} -ffreestanding -c $^ -o $@

%.o: %.asm
	nasm $^ -f elf -o $@

%.bin: %.asm
	nasm $^ -f bin -o $@

clean:
	rm *.bin ${OBJ}
