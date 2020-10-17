ASM      = nasm
ASMFLAGS =

CC       = gcc
CFLAGS   = -m32 -fno-stack-protector -z execstack

LD       = ld
LDFLAGS  = -m elf_i386

TARGET_1 = payload
TARGET_2 = exploit

FORMAT   = elf32

SRCS_1     = payload.nasm
OBJS_1     = payload.o

SRCS_2     = exploit.c
OBJS_2     =

Q        = @

all: payload shellcode exploit

payload:
	$(Q) $(ASM) -f $(FORMAT) $(SRCS_1) $(ASMFLAGS)
	$(Q) $(LD) $(OBJS_1) -o $(TARGET_1) $(LDFLAGS)

shellcode: $(TARGET_1)
	$(Q) objdump -d ./$(TARGET_1) | gxtractor

debug: $(TARGET_1) $(TARGET_2)
	$(Q) strace ./$(TARGET_1)
	$(Q) strace ./$(TARGET_2)

exploit: $(TARGET_1)
	$(Q) python3 generate-c.py $(objdump -d ./$(TARGET_1) | gxtractor) $(SRCS_2)
	$(Q) $(CC) -o $(TARGET_2) $(SRCS_2) $(CFLAGS)
