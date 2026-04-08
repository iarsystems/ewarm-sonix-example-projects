/*************************************************************************
 *
 *    Used with ICCARM and AARM.
 *
 *    (c) Copyright IAR Systems 2006 - 2012
 *
 *    File name   : main.c
 *    Description : Define main module
 *
 *
 *  This example project shows how to use the IAR Embedded Workbench for ARM
 * to develop code for the Sonix SN32F707 Starter Kit V2. It shows basic use
 * of the I/O controller.
 *  It toggles LED1 and LED2.
 *
 * Note:
 *  After power-up the controller get clock from internal RC oscillator that
 * is unstable and may fail with J-Link auto detect.
 *
 *    $Revision: 37 $
 **************************************************************************/
#include <intrinsics.h>
#include <stdint.h>
#include <Sonix/iosn32f707.h>

void delay(void);

/*************************************************************************
 * Function Name: main
 * Parameters: none
 *
 * Return: none
 *
 * Description: main
 *
 *************************************************************************/
int main(void)
{
  GPIO2_MODE = 0x03;
  GPIO2_CFG = 0;

  while(1)
  {
    GPIO2_DATA = 0x03;
    delay();
    GPIO2_DATA = 0x00;
    delay();
  }
}

void delay(void)
{
static unsigned long i=0;

  for (i=0x30000;i>0; i--);

}
