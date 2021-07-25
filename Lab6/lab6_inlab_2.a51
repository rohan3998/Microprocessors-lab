org 00H
ljmp MAIN

org 00BH
	clr TR0	
	ljmp ISR_T0

org 2FH

ISR_T0:
	clr TF0
	mov a,P0
	subb a,#0
	jz loop_20
	mov a,P0
	subb a,#1
	jz loop_30
	mov a,P0
	subb a,#2
	jz loop_40
	mov a,P0
	subb a,#3
	jz loop_50
	
RET



org 50H
MAIN:
	clr P3.2
	;setb P0.0
	;setb P0.1
	;setb P0.2
	clr P0.3
	clr P0.4
	clr P0.5
	clr P0.6
	clr P0.7
	
	mov a,P0
	subb a,#0
	jz loop_20
	mov a,P0
	subb a,#1
	jz loop_30
	mov a,P0
	subb a,#2
	jz loop_40
	mov a,P0
	subb a,#3
	jz loop_50
	;mov a,P0
	;subb a,#4
	;jz loop_60
	;mov a,P0
	;subb a,#5
	;jz loop_70
	;mov a,P0
	;subb a,#6
	;jz loop_80
	;mov a,P0
	;subb a,#7
	;jz loop_90
	
	
	loop_20:
		acall TIMER_DELAY_MODE_20_2
		here1: jnb TF1, here1
		clr TR1
		clr TF1
		cpl P3.2
		acall TIMER_DELAY_MODE_20_1
		here2: jnb TF0, here2
		clr TR0
		clr TF0
		cpl P3.2
		
		ajmp loop_20
	
   loop_30:
		acall TIMER_DELAY_MODE_30_2
		here3: jnb TF1, here3
		clr TR1
		clr TF1
		cpl P3.2
		acall TIMER_DELAY_MODE_30_1
		here4: jnb TF0, here4
		clr TR0
		clr TF0
		cpl P3.2
		
		ajmp loop_30
	
   loop_40:
		acall TIMER_DELAY_MODE_40_2
		here5: jnb TF1, here5
		clr TR1
		clr TF1
		cpl P3.2
		acall TIMER_DELAY_MODE_40_1
		here6: jnb TF0, here6
		clr TR0
		clr TF0
		cpl P3.2
		
		ajmp loop_40
	
    loop_50:
		acall TIMER_DELAY_MODE_50_2
		here7: jnb TF1, here7
		clr TR1
		clr TF1
		cpl P3.2
		acall TIMER_DELAY_MODE_50_1
		here8: jnb TF0, here8
		clr TR0
		clr TF0
		cpl P3.2
		
		ajmp loop_50
	
    TIMER_DELAY_MODE_20_1:
	mov TL0, #70H
	mov TH0, #0FEH
	mov TMOD, #11H
	setb TR0
RET	

TIMER_DELAY_MODE_20_2:
	mov TL1, #0C0H
	mov TH1, #0F9H
	mov TMOD, #11H
	setb TR1
RET	

TIMER_DELAY_MODE_30_1:
	mov TL0, #0A8H
	mov TH0, #0FDH
	mov TMOD, #11H
	setb TR0
RET	

TIMER_DELAY_MODE_30_2:
	mov TL1, #88H
	mov TH1, #0FAH
	mov TMOD, #11H
	setb TR1
RET	

TIMER_DELAY_MODE_40_1:
	mov TL0, #0E0H
	mov TH0, #0FCH
	mov TMOD, #11H
	setb TR0
RET	

TIMER_DELAY_MODE_40_2:
	mov TL1, #50H
	mov TH1, #0FDH
	mov TMOD, #11H
	setb TR1
RET	

TIMER_DELAY_MODE_50_1:
	mov TL0, #018H
	mov TH0, #0FCH
	mov TMOD, #11H
	setb TR0
RET	

TIMER_DELAY_MODE_50_2:
	mov TL1, #18H
	mov TH1, #0FCH
	mov TMOD, #11H
	setb TR1
RET	
	 	
END		
	
