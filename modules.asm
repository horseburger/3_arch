		MODEL SMALL, C
		PUBLIC findChar

		.DATA

char 	DB 		(?)

		.CODE

ShowStr		MACRO
			mov ah, 09H
			int 21H
			ENDM

findChar PROC
		
		int 	3h
		push 	BP
		mov 	BP, SP

		mov 	si, [BP+6]
		mov 	bh, [si]
		mov 	char, bh

		mov 	si, [BP+4]
		mov 	ch, [si]
		xor 	ax, ax
findLoop:

		cmp 	ch, bh
		jne 	notEqual
		inc 	ax
notEqual:
		inc 	si
		mov 	ch, [si]
		cmp 	ch, 0Ah
		je 		koniec
		jmp 	findLoop

koniec:

		pop 	BP
		ret
		ENDP

		END