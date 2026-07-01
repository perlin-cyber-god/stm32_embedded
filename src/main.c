/**
 * @file main.c
 * @brief STM32F1xx Device Information Reader
 * 
 * This program reads and stores various device identification information
 * including device ID, revision, flash size, and unique identifier.
 */

#include "stm32f1xx.h"

/** Device ID extracted from DBGMCU IDCODE register */
volatile uint32_t device_id;

/** Silicon revision ID from DBGMCU IDCODE register */
volatile uint32_t revision_id;

/** Flash memory size in kilobytes */
volatile uint32_t flash_size_kb;

/** Unique device identifier - first 32-bit word */
volatile uint32_t uid0;

/** Unique device identifier - second 32-bit word */
volatile uint32_t uid1;

/** Unique device identifier - third 32-bit word */
volatile uint32_t uid2;

int main(void)
{
    /* Read the IDCODE register from Debug MCU */
    uint32_t idcode = DBGMCU->IDCODE;

    /* Extract device ID (lower 12 bits) from IDCODE */
    device_id   = idcode & 0xFFF;
    
    /* Extract revision ID (bits 16-31) from IDCODE */
    revision_id = (idcode >> 16);

    /* Read flash memory size from flash size register */
    flash_size_kb = *(volatile uint16_t *)FLASHSIZE_BASE;

    /* Read 96-bit unique device identifier (3 x 32-bit words) */
    uid0 = *(volatile uint32_t *)(UID_BASE + 0);
    uid1 = *(volatile uint32_t *)(UID_BASE + 4);
    uid2 = *(volatile uint32_t *)(UID_BASE + 8);

    /* Main loop - add application logic here */
    while (1)
    {
        /* Placeholder for main application loop */
    }
}