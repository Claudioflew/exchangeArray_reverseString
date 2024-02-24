COMMENT !
Description: Exchanges every pair of values in an array with an even number of elemnts,
using a loop and indexed addressing. Ex. {1, 2, 3, 4} will be {2, 1, 4, 3}.
Author name: Koichi Nakata
Author email: kanakta595@insite.4cd.edu
Last modified date: February 23, 2024
Creation date: February 23, 2024
!

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
evenArray word 1234h, 5678h, 9ABCh, 0DEF0h, 0FEDCh, 0BA09h, 8765h, 4321h
oddArray byte 1, 2, 3, 4, 5

.code
main PROC
	mov esi, offset evenArray			; Save the memory location of the first element
	mov ecx, lengthof evenArray / 2		; Initialize a counter variable
L1:
	mov ax, [esi]						; Save the first part of the pair to ax
	xchg ax, [esi+2]					; Second part is (first part + 2 bytes)
	mov [esi], ax						

	add esi, 4							; Iterate to the next pair, which is +4 bytes
	loop L1

	mov esi, offset oddArray
	mov ecx, lengthof oddArray / 2		; Truncate the decimal part
L2:
	mov al, [esi]
	xchg al, [esi + type oddArray]		; Use TYPE directive to generalize the function
	mov [esi], al

	add esi, type oddArray * 2			; Scale factors
	loop L2
	
	CALL DumpRegs

	INVOKE ExitProcess, 0
main endp
end main