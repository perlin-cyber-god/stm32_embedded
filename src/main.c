#include "stm32f1xx.h"

int main(void)
{
    /* Enable clocks for GPIOA and GPIOC */
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;
    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

    /* PA5 -> Output Push-Pull 2 MHz */
    GPIOA->CRL &= ~(0xF << 20);
    GPIOA->CRL |=  (0x2 << 20);

    /* PC13 -> Input with Pull-Up/Pull-Down */
    GPIOC->CRH &= ~(0xF << 20);
    GPIOC->CRH |=  (0x8 << 20);

    /* Select Pull-Up */
    GPIOC->ODR |= (1U << 13);

    while (1)
    {
        if (GPIOC->IDR & (1U << 13))
        {
            /* Button released */
            GPIOA->BSRR = (1U << (5 + 16));   // Reset PA5
        }
        else
        {
            /* Button pressed */
            GPIOA->BSRR = (1U << 5);          // Set PA5
        }
    }
}