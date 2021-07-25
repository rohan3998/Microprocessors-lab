org 00H
	ljmp MAIN

org 00BH
	clr TR0	
	ljmp ISR_T0

org 50H

ISR_T0:
	clr TF0
	cpl P3.2
	mov TL0, #18H
	mov TH0, #0FCH
	mov TMOD, #01H
	setb TR0
RETI

MAIN:
	mov IE, #82H
	clr P3.2
	mov TL0, #18H
	mov TH0, #0FCH
	mov TMOD, #01H
	setb TR0	
	here: sjmp here
END	