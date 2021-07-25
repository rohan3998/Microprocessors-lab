org 0H
ljmp main


org 50H
delay :
	    Using 0
		push PSW
		push AR2
		back0:
		      mov R4, 200
			  back1:
					mov R3, #0FFH
					back2:
						  djnz R3, back2
						  djnz R4, back1
						  djnz R2, back0
		pop AR2
		pop PSW
		ret
org 100H
main:
	 mov P1,#0H
	 mov b, 4Fh
	 mov a, #0AH
	 mul ab
	 mov R2, a
	 
	 Loop:
	       cpl P1.7
		   lcall delay
		   sjmp Loop
end
	