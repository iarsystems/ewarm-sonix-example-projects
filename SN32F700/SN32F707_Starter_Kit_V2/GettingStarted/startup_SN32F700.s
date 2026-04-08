/**************************************************
 *
 * Part one of the system initialization code, contains low-level
 * initialization, plain thumb variant.
 *
 * Copyright 2012 IAR Systems. All rights reserved.
 *
 * $Revision: 37 $
 *
 **************************************************/

;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbol _program_start or
; a user defined start symbol.
; To override the cstartup defined in the library, simply add your modified
; version to the workbench project.
;
; The vector table is normally located at address 0.
; When debugging in RAM, it can be located in RAM, aligned to at least 2^6.
; The name "__vector_table" has special meaning for C-SPY:
; it is where the SP start value is found, and the NVIC vector
; table register (VTOR) is initialized to this address if != 0.
;
; Cortex-M version
;


        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        PUBLIC  __vector_table
        PUBLIC  __vector_table_0x1c

        DATA

__vector_table
        DCD     sfe(CSTACK)                 ; Top of Stack
        DCD     __iar_program_start         ; Reset Handler
        DCD     NMI_Handler                 ; NMI Handler
        DCD     HardFault_Handler           ; Hard Fault Handler
        DCD     MemManage_Handler           ; MPU Fault Handler
        DCD     BusFault_Handler            ; Bus Fault Handler
        DCD     UsageFault_Handler          ; Usage Fault Handler
__vector_table_0x1c
        DCD     0
        DCD     0
        DCD     0
        DCD     0
        DCD     SVC_Handler
        DCD     0
        DCD     0
        DCD     PendSV_Handler
        DCD     SysTick_Handler

        ; External Interrupts
        DCD   WAKEUP_IRQHandler             ;  Wakeup
        DCD   SSP0_IRQHandler               ;  SPI/SSP0
        DCD   SSP1_IRQHandler               ;  SPI/SSP1
        DCD   I2C0_IRQHandler               ;  I2C0
        DCD   CT16B0_IRQHandler             ;  16-bit Counter-Timer 0
        DCD   CT16B1_IRQHandler             ;  16-bit Counter-Timer 1
        DCD   CT32B0_IRQHandler             ;  32-bit Counter-Timer 0
        DCD   CT32B1_IRQHandler             ;  32-bit Counter-Timer 1
        DCD   I2S_IRQHandler                ;  I2S
        DCD   USART0_IRQHandler             ;  USART0
        DCD   USART1_IRQHandler             ;  USART1
        DCD   I2C1_IRQHandler               ;  Reserved
        DCD   ADC_IRQHandler                ;  A/D Converter
        DCD   WDT_IRQHandler                ;  Watchdog Timer
        DCD   LVD_IRQHandler                ;  Low Voltage Detect
        DCD   RTC_IRQHandler                ;  Real Time Clock
        DCD   P3_IRQHandler                 ;  PIO INT3
        DCD   P2_IRQHandler                 ;  PIO INT2
        DCD   P1_IRQHandler                 ;  PIO INT1
        DCD   P0_IRQHandler                 ;  PIO INT0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Default interrupt handlers.
;;
        THUMB
        SECTION .text:CODE:REORDER:NOROOT(1)

        PUBWEAK NMI_Handler
        PUBWEAK HardFault_Handler
        PUBWEAK MemManage_Handler
        PUBWEAK BusFault_Handler
        PUBWEAK UsageFault_Handler
        PUBWEAK SVC_Handler
        PUBWEAK PendSV_Handler
        PUBWEAK SysTick_Handler
        PUBWEAK WAKEUP_IRQHandler
        PUBWEAK SSP0_IRQHandler
        PUBWEAK SSP1_IRQHandler
        PUBWEAK I2C0_IRQHandler
        PUBWEAK CT16B0_IRQHandler
        PUBWEAK CT16B1_IRQHandler
        PUBWEAK CT32B0_IRQHandler
        PUBWEAK CT32B1_IRQHandler
        PUBWEAK I2S_IRQHandler
        PUBWEAK USART0_IRQHandler
        PUBWEAK USART1_IRQHandler
        PUBWEAK I2C1_IRQHandler
        PUBWEAK ADC_IRQHandler
        PUBWEAK WDT_IRQHandler
        PUBWEAK LVD_IRQHandler
        PUBWEAK RTC_IRQHandler
        PUBWEAK P3_IRQHandler
        PUBWEAK P2_IRQHandler
        PUBWEAK P1_IRQHandler
        PUBWEAK P0_IRQHandler

NMI_Handler:
HardFault_Handler:
MemManage_Handler:
BusFault_Handler:
UsageFault_Handler:
SVC_Handler:
PendSV_Handler:
SysTick_Handler:
WAKEUP_IRQHandler:
SSP0_IRQHandler:
SSP1_IRQHandler:
I2C0_IRQHandler:
CT16B0_IRQHandler:
CT16B1_IRQHandler:
CT32B0_IRQHandler:
CT32B1_IRQHandler:
I2S_IRQHandler:
USART0_IRQHandler:
USART1_IRQHandler:
I2C1_IRQHandler:
ADC_IRQHandler:
WDT_IRQHandler:
LVD_IRQHandler:
RTC_IRQHandler:
P3_IRQHandler:
P2_IRQHandler:
P1_IRQHandler:
P0_IRQHandler:
Default_Handler:
        B Default_Handler

        END
