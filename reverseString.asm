COMMENT !
Description: Reverse a string, using a loop and indirect operand.
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
source byte "This is the source string", 0
target byte sizeof source DUP(0)

.code
main PROC
	mov ecx, (sizeof source) - 1	; We want to ignore the last null terminator
	mov edi, 0						; Offset indexing variable
L1:
	mov al, source[ecx - 1]			; Be careful with the last index of the string
	mov target[edi], al				; Transfer to the char to the target
	inc edi							; Increment the offset index by 1 byte
	loop L1

	CALL DumpRegs

	INVOKE ExitProcess, 0
main endp
end main