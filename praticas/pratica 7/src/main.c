#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include "pico/stdlib.h"

// Cabecalhos customizados
#include "led.h"
#include "bttn.h"
#include "cpu_monitor.h"

QueueHandle_t BTTN_Queue;
SemaphoreHandle_t xButtonSemaphore;

#include "portable.h"
#include "cpu_monitor.h"

#define HEAP_LOW_THRESHOLD (HEAP_REGION_SIZE / 10) // 10% do heap total
#define HEAP_REGION_SIZE  (8 * 1024) // 8 KB, ajuste conforme sua RAM

#define LED_HEAP 15 // Defina o pino do LED 15

static uint8_t ucHeap[HEAP_REGION_SIZE];

void heap_led_task(void *pvParameters) {
    
    BlinkParams_t *params = (BlinkParams_t *)pvParameters;
    
    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);
    
    for (;;) {
        size_t free_heap = xPortGetFreeHeapSize();
        printf("Heap livre atual led: %u bytes\n", (unsigned)free_heap);

        if (free_heap < HEAP_LOW_THRESHOLD) {
            gpio_put(params->led_pin, ON); // Acende o LED se heap < 10%
        } else {
            gpio_put(params->led_pin, OFF); // Apaga o LED caso contrário
        }

        vTaskDelay(pdMS_TO_TICKS(3000)); // 1 segundo
    }
}

int main() {

    BlinkParams_t led0 = {LED_0,NULL, LED_Sample_Rate, "LED 0"};
    BlinkParams_t led_heap = {15,NULL, LED_Sample_Rate, "LED Heap"};
    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    
    HeapRegion_t xHeapRegions[] = {
        { ucHeap, sizeof(ucHeap) },
        { NULL,   0 } // Fim da lista
    };
    
    vPortDefineHeapRegions(xHeapRegions);

    stdio_init_all();
    
    xTaskCreate(led_task, "LED_0", 256,  &led0, 3, set_TaskHandler_Idex());
    xTaskCreate(cpu_heap_measure_task,"Task_Monitor_CPU", 256, NULL, 2, set_TaskHandler_Idex());
    xTaskCreate(heap_led_task, "Heap_LED_Task", 256, &led_heap, 2, set_TaskHandler_Idex());


    vTaskStartScheduler();

    while(1);
}