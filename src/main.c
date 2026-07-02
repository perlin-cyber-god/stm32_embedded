#include "stm32f1xx.h"  /* Include STM32F1 peripheral register definitions */

static void delay(void)
{
    /* Start a counter that will run for 500000 iterations */
    for (volatile uint32_t i = 0; i < 500000; i++)
    {
        /* Execute a no-operation instruction to waste CPU cycles */
        __NOP();
    }
}

int main(void)
{
    /* Enable the clock for GPIOA by setting the IOPAEN bit in RCC->APB2ENR */
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;

    /* Clear the 4-bit field for PA5 in GPIOA->CRL so the pin starts from a known state */
    GPIOA->CRL &= ~(0xF << 20);

    /* Configure PA5 as a 2 MHz general-purpose push-pull output:
       - bits 20..23 of CRL control pin 5
       - 0x2 means MODE=10 (2 MHz output) and CNF=00 (general-purpose push-pull) */
    GPIOA->CRL |= (0x2 << 20);

    /* Infinite loop: keep toggling PA5 forever */
    while (1)
    {
        /* Write to BSRR bit 5 to set PA5 high (turn the output on) */
        GPIOA->BSRR = (1U << 5);

        /* Wait briefly before changing the pin state again */
        delay();

        /* Write to BSRR bit 21 to reset PA5 low (turn the output off)
           Bit 21 is used because BSRR has a high-half for reset operations:
           bit 5 sets the pin, bit 21 resets the pin */
        GPIOA->BSRR = (1U << (5 + 16));

        /* Wait again before the next toggle */
        delay();
    }
}