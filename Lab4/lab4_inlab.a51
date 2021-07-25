org 0H
ljmp main


org 200H
delay1 :
	    Using 0
		push PSW
		push AR3
		push AR4
		push AR2
		
				    
					
					mov R2,#20
						back0:
							mov R4,#200
								back1:
										mov R3, #0FFH
											back2:
													djnz R3, back2
													djnz R4, back1
													djnz R2, back0
													
		pop AR4
		pop AR3
		pop AR2
		pop PSW
		ret

delay5 :
	    Using 0
		push PSW
		push AR3
		push AR4
		push AR2
		
				    
					
					mov R2,#100
						back3:
							mov R4,#200
								back4:
										mov R3, #0FFH
											back5:
													djnz R3, back5
													djnz R4, back4
													djnz R2, back3
													
		pop AR4
		pop AR3
		pop AR2
		pop PSW
		ret

readNibble : 
             
			 ;setb P1.0
			 ;setb P1.1
			 ;setb P1.2
			 ;setb P1.3
			 ;setb P1.4
			 ;setb P1.5
			 ;setb P1.6
			 ;setb P1.7
			 clr P1.4
			 clr P1.5
			 clr P1.6
			 clr P1.7
			 
			 mov P1,#0FFH
			 lcall delay5
             clr P1.4
			 clr P1.5
			 clr P1.6
			 clr P1.7
			 lcall delay1
			 mov a,P1
			 swap a
			 mov P1,a
			 lcall delay5
			 ret

packNibbles : 
	         mov R0,#4FH
			 mov R1,#50H
			 mov a,@R0
			 swap a
			 dec R0
			 orl a,@R0
			 mov @R1,a
			 ret
			 
			 

org 100H
main:
      lcall readNibble
	  mov 4EH,a
	  lcall readNibble
	  mov 4FH,a
	  lcall packNibbles
	  here: sjmp here
	  end

	
