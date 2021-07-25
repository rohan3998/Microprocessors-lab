org 0H
ljmp main;

org 100H
main:
     mov r0, #50H
	 mov r1, #51H
	 mov a,@r0
	 mov r2,a
	 loop :
	        mov @r1,#00
			inc r1
			djnz r2, loop
		
	 end
		 