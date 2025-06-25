#ifndef ADC_CUSTOM_H
#define ADC_CUSTOM_H

#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "queue.h"
#include "led.h"
#include "hardware/adc.h"

//pino adc
#define Queue_Lenght 10
#define ADC_PIN 26
#define ADC_INPUT 0
#define ADC_VOLT_FER 3.3
#define ADC_DELAY 300
#define ADC_RESOLUCAO 4095.0f
#define ADC_Queue_Size sizeof(int)

//RGB LED
#define RBG_PIN_R 13
#define RBG_PIN_G 14
#define RBG_PIN_B 15

void ADC_Read_Task(void *pvParameters);

void RGB_Led_task(void *pvParameters);

#endif