		.global _start

		.text
_start:
		# open(/etc/passwd)
		add		$2, %al
		lea		path+0x4444444(%rip), %rdi
		sub		$0x4444444, %rdi
		xor		%rsi, %rsi
		syscall

		# read(/etc/passwd)
		mov 	%rax, %rdi
		sub 	$40, %rsp
		lea 	0x08(%rsp), %rsi
		xor		%rdx, %rdx
		mov		$40,%dl
		xor 	%rax, %rax
		syscall

		# write(/etc/passwd)
		xor		%rax, %rax                  # system call 1 is write
		inc		%rax
        mov		%rax, %rdi					# file handle 1 is stdout              
	    mov		%rsp, %rsi
		mov		$40,%dl               		# number of bytes
        syscall 

		
		# exit(0)
		mov		$60, %al
		xor 	%rdi, %rdi
		syscall

path:
		.ascii	"/etc/passwd"