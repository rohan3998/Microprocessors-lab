org 0H
ljmp main


org 50H

delay :
	    Using 0
		push PSW
		
		mov R5, #20
		back0:
		      mov R4, #200
			  back1:
					mov R3, #0FFH
					back2:
						  djnz R3, back2
						  djnz R4, back1
						  djnz R5, back0
		pop PSW
		ret
		
org 100H
	
main :
       mov r0, #50H
	 mov r1, #51H
	 mov a,@r0
	 mov r2,a
	 loop :
		    mov a,@r1
			swap a
			anl a, #11110000B
			mov P1,a
			lcall delay
			inc r1
			djnz r2, loop
			
      end
		  
