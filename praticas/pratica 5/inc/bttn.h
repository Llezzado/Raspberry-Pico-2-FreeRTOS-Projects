#ifndef BTTN_H
#define BTTN_H

#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "led.h"
#include "queue.h"

extern QueueHandle_t BTTN_Queue;

#define BTTN_PIN_0 16
#define BTTN_PIN_1 17
#define BTTN_DELAY 100
#define BTTN_Queue_Size sizeof(uint32_t)
#define ON 1
#define OFF 0

typedef struct{
    uint pin;
    uint debouce_delay;
    uint command;

}Bttn_Params_t;



void Button_task(void *pvParameters);
void process_button_task(void *pvParameters);

#endif