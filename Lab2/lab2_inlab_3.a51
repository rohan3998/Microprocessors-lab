org 0H
ljmp main

org 100H

bit2ascii_1 : 
	        mov r4,a
	        mov r0,#52H
			mov a,@r0
			mov r0,a
			mov a,r4
			swap a
			anl a,#00001111B
			subb a,#0AH
			JNC more_10
			more_10 : add a,#41H
			          mov @r0,a
			           ret
			JC less_10
			less_10 : add a,#30H
			          mov @r0,a
					  ret
			
			
bit2ascii_2 :
	        mov r0,#52H
			mov a,@r0
			mov r0,a
			inc r0
			mov a,r4
			anl a,#00001111B
			subb a,#0AH
			JNC more_10
			JC less_10
			
			 

main :
	   mov r0,#50H
	   mov r1,#51H
	   mov a,@r0
	   mov r2,a
	   mov a,#0
	   mov b,@r1
	   mov r1,b
           loop : add a,@r1
				  inc r1
				  djnz r2,loop
	   cpl a
	   add a,#1
	   mov @r1,a
	   
	   lcall bit2ascii_1
	   lcall bit2ascii_2
	   
	   end
	   