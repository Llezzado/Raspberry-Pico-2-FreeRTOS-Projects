#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include "pico/stdlib.h"

// Cabecalhos customizados
#include "led.h"
#include "bttn.h"
#include "cpu_monitor.h"

#include "adc_custom.h"

QueueHandle_t BTTN_Queue;
SemaphoreHandle_t xButtonSemaphore;

//informações da pratica 6:
#include "semphr.h"
#include "hardware/adc.h"

Acelerometro_Params_t Acelerometro_dados = {BTTN_PIN_0,task_read_rate,task_deadline_rate,0};

int main() {

    Printf_mutex = xSemaphoreCreateMutex();

    BlinkParams_t led0 = {LED_0,NULL, LED_Sample_Rate, "LED 0"};
    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    xButtonSemaphore = xSemaphoreCreateBinary();

    stdio_init_all();
    
    xTaskCreate(led_task, "LED_0", 256, &led0, 4, NULL);

    vTaskStartScheduler();

    while(1);
}