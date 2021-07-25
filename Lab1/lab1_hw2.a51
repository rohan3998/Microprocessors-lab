ORG 0000H
;-- The first opcode is burned into ROM address 0000H,
;-- since this is where the 8051 looks for the first 
;-- instruction when it is booted.
;-- We achieve this by the ORG 00H statement in the source program

LJMP MAIN

;R0 and R1 should contain the address of two no.
;location given by R0:- 	MSB of 1st no.
;location given by R0+1:-	LSB of 1st no.
;location given by R1:- 	MSB of 1st no.
;location given by R1+1:-	LSB of 1st no.
;location given by R0+2:- 	CARRY	
;location given by R0+3:-	MSB OF ANS	
;location given by R0+4:- 	LSB OF ANS

;---------------------------------------------------------;
ORG 50H
;this function adds and stores result in appropriate location
ADDER_16BIT:
	mov a,r5
	add a,r4
	mov r6,a ; result of lsb
	mov a,r2
	addc a,r3
	mov r7,a; result of msb
	add a,#80
	mov a,#0
	addc a,#0
	inc r0
	mov @r0,a
	mov a,r7
	inc r0
	mov @r0,a
	mov a,r6
	inc r0
	mov @r0,a
	;-- perform the addition/subtraction of two 16-bit no.
	;-- use subroutine written for addition of two 8-bit no.
	;-- remember the no. are given in 2's complement form
	;-- take care when you set carry/borrow.
	;-- store the result at appropriate locations.
	
	RET
;-- end of subroutine ADDER_16BIT	

	

INIT:
	mov r0,#60H
	mov r1,#70H
	mov a,@r0
	mov r2,a ; msb of op1
	mov a,@r1
	mov r3,a ; msb of op2
	inc r0
	inc r1
	mov a,@r0
	mov r4,a ; lsb of op1
	mov a,@r1
	mov r5,a ; lsb of op2
	
	
	;-- store the numbers to be added/subtracted at appropriate location
	RET
;-- end of subroutine INIT



ORG 0200H
MAIN:
    
	ACALL INIT	    ;-- calling a subroutine INIT
	ACALL ADDER_16BIT   ;-- calling a subroutine ADDER_16BIT
	
HERE:SJMP HERE
END

