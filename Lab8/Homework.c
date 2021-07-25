#include "at89c5131.h"
#include "serial.c"
sbit LED = P1^4;


void main(void)
{
   uart_init();					//Call function to initialize UART
   while(1)   
	 {
		    LED = 1;
     		transmit_char('A');
		 delay_ms(50);
		 LED = 0;
//Call function to transmit 'A'
		delay_ms(50);//Call 100 ms delay function
    
	 }		 
	 
}
