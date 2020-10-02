
		.global _start

		.text
_start:
		# open(/etc/passwd)
		xor		%rax, %rax
		inc		%rax
		inc		%rax
		mov		$path, %rdi
		xor		%rsi, %rsi
		syscall

		# read(/etc/passwd)
		mov 	%rax, %rdi
		sub 	$2556, %rsp
		lea 	0x08(%rsp), %rsi
		mov		$2556,%rdx
		xor 	%rax, %rax
		syscall

		# write(/etc/passwd)
		xor		%rax, %rax                  # system call 1 is write
		inc		%rax
        xor		%rdi, %rdi					# file handle 1 is stdout
		inc		%rdi                
	    mov		%rsp, %rsi
        mov     $2556, %rdx               # number of bytes
        syscall 

		
		# exit(0)
		mov		$60, %rax
		xor 	%rdi, %rdi
		syscall

path:
		.ascii	"/etc/passwd"
