main:
	bcc main.cpp modules.asm
	del *.obj
	del *.map