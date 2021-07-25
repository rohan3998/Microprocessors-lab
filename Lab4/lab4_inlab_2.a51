org 0H
ljmp main


org 50H
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

delay2 :
	    Using 0
		push PSW
		push AR3
		push AR4
		push AR2
		
				    
					
					mov R2,#40
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
		
delay5 :
	    Using 0
		push PSW
		push AR3
		push AR4
		push AR2
		
				    
					
					mov R2,#100
						back6:
							mov R4,#200
								back7:
										mov R3, #0FFH
											back8:
													djnz R3, back8
													djnz R4, back7
													djnz R2, back6
													
		pop AR4
		pop AR3
		pop AR2
		pop PSW
		ret
		

readNibble : 
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

packNibbles1 : 
	         mov R0,#4AH
			 mov R1,#50H
			 mov a,@R0
			 swap a
			 inc R0
			 orl a,@R0
			 mov @R1,a
			 ret
packNibbles2 : 
	         mov R0,#4CH
			 mov R1,#51H
			 mov a,@R0
			 swap a
			 inc R0
			 orl a,@R0
			 mov @R1,a
			 ret
			 
			 

org 100H
main:
      lcall readNibble
	  mov 4AH,a              ;lsb1
	  lcall readNibble
	  mov 4BH,a               ;msb1
	  lcall readNibble
	  mov 4CH,a              ;lsb2
	  lcall readNibble
	  mov 4DH,a				; msb2
	  lcall packNibbles1
	  lcall packNibbles2
	  dec R1
	  add a,@R1
	  cpl a
	  add a,#1
	  mov 52H,a
	  mov P1,a
	  lcall delay2
	  swap a
	  mov P1,a
	  
	  
	  here: sjmp here
	  end

	
