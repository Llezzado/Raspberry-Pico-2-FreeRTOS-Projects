#ifndef BTTN_H
#define BTTN_H

#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "hardware/adc.h"
#include "pico/stdlib.h"
#include "led.h"
#include "queue.h"
#include "semphr.h"

//pino bttn
extern QueueHandle_t BTTN_Queue;

#define BTTN_PIN_0 16
#define BTTN_PIN_1 17
#define BTTN_DELAY 100
#define BTTN_Queue_Size sizeof(uint32_t)
#define Queue_Lenght 10

extern SemaphoreHandle_t xButtonSemaphore;
#define smpr_Count 10

typedef struct{
    uint pin;
    uint debouce_delay;
    uint command;

}Bttn_Params_t;

void Button_task(void *pvParameters);

void process_button_task(void *pvParameters);

void Pulling_CPU_Usage_task(void *pvParameters);

void semaphore_consumer_task(void *pvParameters);

void semaphore_status_task(void *pvParameters);

void gpio_callback(uint gpio, uint32_t events);

#endif