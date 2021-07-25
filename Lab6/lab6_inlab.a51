org 00H
	ljmp MAIN

org 00BH
	clr TR0	
	ljmp ISR_T0

org 01BH
	clr TR1	
	ljmp ISR_T1

org 50H


ISR_T0:
	clr TF0
	clr TF1
	cpl P3.2
	mov TL0, #30H
	mov TH0, #0F8H
	mov TMOD, #11H
	acall comp
	mov a,R0
	mov TH1,a
	mov a,R1
	mov TL1,a
	
	setb TR0
	setb TR1
	
RETI

ISR_T1:
	clr TF1
	
	acall comp
	mov a,R0
	mov TH1,a
	mov a,R1
	mov TL1,a
	mov TMOD, #11H
	clr TR1
	cpl P3.2
RETI

comp : mov a,P1
	       anl a,#00000111B
		   inc a
		   inc a
		   mov b,#200
		   mul ab
		   cpl a
		   add a,#1
		   mov R1,a
		   mov a,b
		   cpl a
		   addc a,#0
		   mov R0,a
		   ret
	
	
MAIN:
	mov IE, #8AH
	setb P3.2
	mov A,#0FFH
	mov P1,A
	mov TMOD,#11
	mov TH0,#0F8H
	mov TL0,#30H
	mov TH1,#0FFH
	mov TL1,#0FFH
	setb TR0
	setb TR1
	here: sjmp here
	
		   
END	