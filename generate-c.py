if len(sys.argv) < 3:
    print("Usage: generate-c <shellcode> <output_file>")
    sys.exit()

shellcode = sys.argv[1]
output = sys.argv[2]

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

file = open(output, "a")
file.write(code)
file.close()
