
org 0H
ljmp main


org 50H
delay :
	    Using 0
		push PSW
		push AR3
		push AR4
		push AR5
		push AR6
		cpl P1.7
		mov R6,#2
		back4:
			 
			 cpl P1.6
			 mov R5,#2
		      back3:
				    
					cpl P1.5
					mov R2,a
						back0:
							mov R4,#100
								back1:
										mov R3, #0FFH
											back2:
													djnz R3, back2
													djnz R4, back1
													djnz R2, back0
													djnz R5, back3
													djnz R6, back4
		pop AR6											
		pop AR5
		pop AR4
		pop AR3
		pop PSW
		ret
org 100H
main:
	 
     setb P1.0 
	 setb P1.1
	 setb P1.2
	 setb P1.3
	 clr P1.4
	 clr P1.5
	 clr P1.6
	 clr P1.7
	 mov a,P1
	 anl a,#0FH
	 mov b,a
	 mov a, #10
	 mul ab
	 mov R2, a
	 loop:
	     lcall delay
	 	 sjmp loop  
		   
end
	