		MODEL SMALL, C
		PUBLIC findChar
		PUBLIC arrayAvg
		.386P

		.DATA

; charsum 	DW 		(?)

		.CODE

ShowStr		MACRO
			mov ah, 09H
			int 21H
			ENDM

arrayAvg	PROC
		
		int 	3h
		push 	BP
		mov 	BP, SP
		sub 	SP, 4

		mov 	CX, [BP+6]
		mov 	word ptr [bp-4], CX
		mov 	word ptr [bp-2], 0

		mov 	bx, [BP+4]
		fldz

addLoop:
		fadd 	dword ptr [bx]
		add 	bx, 4
		loop 	addLoop
		fidiv 	dword ptr [bp-4]


		add 	SP, 4
		pop 	BP
		ret
		ENDP

findChar PROC
		
		int 	3h
		push 	BP
		mov 	BP, SP
		sub 	SP, 2

		mov 	si, [BP+6]
		mov 	bh, [si]

		mov 	si, [BP+4]
		mov 	ch, [si]
		mov 	byte ptr [bp-2], 0
findLoop:

		cmp 	ch, bh
		jne 	notEqual
		inc 	byte ptr[BP-2]
notEqual:
		inc 	si
		mov 	ch, [si]
		cmp 	ch, 0Ah
		je 		koniec
		jmp 	findLoop

koniec:

		xor 	ah, ah
		mov 	al, byte ptr [bp-2]
		add 	SP, 2
		pop 	BP
		ret
		ENDP

		END