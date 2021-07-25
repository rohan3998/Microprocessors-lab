#include <at89c5131.h>
#include "lcd.h"
#include "serial.c"

sbit LED7=P1^7;
sbit LED6=P1^6;
sbit LED5=P1^5;
sbit LED4=P1^4;
sbit LED3=P1^3;
sbit LED2=P1^2;
sbit LED1=P1^1;
sbit LED0=P1^0;
unsigned int intr_count = 0,rx_buf = 0, intr_count2=0, var=0	;
//bit tx_complete = 0;
//bit rx_complete = 0;

void timer_ISR(void) interrupt 1
{
		intr_count++;
	if(intr_count==1000){
	  LED7 = ~LED7;
		intr_count=0;
		intr_count2++;
	}
	TF0=0;
	TR0=0;
	var=1;
}	

void gpio_test(void)
{
	P1 = 0x0F;
	LED7=LED3;
	LED6=LED2;
	LED5=LED1;
	LED4=LED0;
// Write your testing code here.
}	

void led_test(void)
{
	P1 = 0xF0;
// Write your testing code here.	
}

void lcd_test(void)
{
  lcd_write_string("LCD is tested");// Write your testing code here.
}	

void timer_test(void)
{ 
	while(intr_count2<10){
		TR0=1;
	  TL0 = 0x18;
		TH0 = 0xFC;
		var=0;
		while(var!=1);
		
	
}
// Write your testing code here.
}

void main(void)
{
	unsigned char ch=0;
	P1 = 0x0F;
	lcd_init();
	uart_init();
	transmit_string("************************\r\n");
	transmit_string("******8051 Tests********\r\n");
	transmit_string("************************\r\n");
	transmit_string("Press 1 for GPIO test\r\n");
	transmit_string("Press 2 for LED test\r\n");
	transmit_string("Press 3 for LCD test\r\n");
	
	while(1)
	{
			ch = receive_char();
			switch(ch)
			{
				case '1':gpio_test();
								 transmit_string("GPIO tested\r\n");
								 break;
				case '2':led_test();
								 transmit_string("LED tested\r\n");
								 break;
				case '3':lcd_test();
								 transmit_string("LCD tested\r\n");
								 break;
				case '4':timer_test();
								 transmit_string("Timer tested\r\n");
								 break;
								
				default:transmit_string("Incorrect test.Pass correct number\r\n");
								 break;
				
			}		
	}
}
