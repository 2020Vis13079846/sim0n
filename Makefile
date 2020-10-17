ASM      = nasm
ASMFLAGS =

LD       = ld
LDFLAGS  =

TARGET   = payload
FORMAT   = elf64

SRCS     = payload.nasm
Q        = @

all: payload shellcode

payload:
	$(Q) $(ASM) -f $(FORMAT) $(SRCS) $(ASMFLAGS)
	$(Q) $(LD) payload.o -o $(TARGET) $(LDFLAGS)

shellcode: $(TARGET)
	$(Q) objdump -d ./$(TARGET) | gxtractor

debug: $(TARGET)
	$(Q) strace ./$(TARGET)
