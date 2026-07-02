#include "stm32f1xx.h"

static void delay(void)
{
    for (volatile uint32_t i = 0; i < 500000; i++)
    {
        __NOP();
    }
}

int main(void)
{
    /* Enable GPIOA clock */
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;

    /* Configure PA5 as General Purpose Push-Pull Output (2 MHz) */
    GPIOA->CRL &= ~(0xF << 20);
    GPIOA->CRL |=  (0x2 << 20);

    while (1)
    {
        /* Set PA5 */
        GPIOA->BSRR = (1U << 5);

        delay();

        /* Reset PA5 */
        GPIOA->BSRR = (1U << (5 + 16));

        delay();
    }
}