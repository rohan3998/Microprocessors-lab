org 00H
ljmp MAIN
org 50H

TIMER_DELAY_MODE_1:
	mov TL0, #18H
	mov TH0, #0FCH
	mov TMOD, #01H
	setb TR0
RET	

MAIN:
	clr P3.2
	loop:
		acall TIMER_DELAY_MODE_1
		here: jnb TF0, here
		clr TR0
		clr TF0
		cpl P3.2
		ajmp loop
		
END		