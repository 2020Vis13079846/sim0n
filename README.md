# sim0n

*Buffer overflow, AAAAAAAAA, Segmentation fault*

Sim0n is a Linux remote shell exploit that exploits memory vulnerabilities via shell code generated with execve system call.

## Usage

**1** Start the listener on your computer

```
nc -lvp 4444
```

**2.** Modify this string of payload

https://github.com/enty8080/sim0n/blob/0367c93413a0dba5829f4ee1b2843b7ca1b68fb6/payload.nasm#L55
