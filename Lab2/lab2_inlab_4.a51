org 0H
ljmp main


org 50H

memcpy : 
	     using 0
		 push PSW
         loop: 
			   mov a,@r0
			   mov @r1,a
			   inc r0
			   inc r1
			   djnz r3,loop
		
	     pop PSW
		 ret
			  

main :
	   mov r0,#50H
	   mov r1,#51H
	   mov a,@r0
	   mov r3,a
	   mov a,@r1
	   mov r0,a
	   inc r1
	   mov b,@r1
	   mov r1,b
	
	   lcall memcpy
	   
	   end
	   
	   