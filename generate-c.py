print("Generate C 1.0")
print("Use 'make shellcode' to generate shellcode.")
shellcode = input('Enter generated shellcode: ')

code = ""

code += "#include<stdio.h>\n"
code += "#include<string.h>\n"
code += "\n"
code += "unsigned char shellcode[] = \""+shellcode+"\";\n"
code += "\n"
code += "int main()\n"
code += "{\n"
code += "    int (*ret)() = (int(*)())shellcode;\n"
code += "    ret();\n"
code += "}\n"

file = open("exploit.c", "a")
file.write(code)
file.close()
