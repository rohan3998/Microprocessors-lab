ORG 00H
;-- code memory location 00h
LJMP MAIN

ORG 50H
;-- code memory location 50h

INIT:
	 mov r0,#40H
	 mov r1,#1
	 mov r2,#40
	 mov a,40H
	 
	 mov a,#0
	 
	;-- store the numbers to be added at appropriate locations
	
	RET
;-- end of subroutine INIT

ADD_40:
	loop :
	      add a,r1
		  mov b,r1
		  mov @r0,b
		  inc r0
		  inc r1
		  djnz r2,loop
	
    mov 69H,a
     	 
		  
	;-- add the numbers stored from memory location 40h to 67h
	;-- by using subroutine written in homework

	RET
;-- end of subroutine ADD_40
	
TWOS_COMP:
		
			cpl a
			add a,#1
			mov @r0,a
			
	;-- perform 2's compliment of the resultant sum
	;-- store the checksum byte at memory location 68h
	
	RET
;-- end of subroutine TWOS_COMP

ADD_41:
	   add a,69H
	   mov 70H,a
			 
			 
	          
			 
        ;-- add numbers from memory location 40h to 68h
	
	RET
;-- end of subroutine ADD_41

ORG 0200H
;-- code memory location 200h
MAIN:
	ACALL INIT
	ACALL ADD_40
	ACALL TWOS_COMP
	ACALL ADD_41	;verify the result
	HERE:SJMP HERE
END



