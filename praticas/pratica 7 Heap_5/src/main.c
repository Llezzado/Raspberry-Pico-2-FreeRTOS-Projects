#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"

#include "led.h"
#include "queue.h"
#include "cpu_monitor.h"

#define Queue_Lenght 2
QueueHandle_t BTTN_Queue;

//pino bttn
#define LED_HEAP 15
#define BTTN_PIN_0 16
#define BTTN_PIN_1 17
#define BTTN_DELAY 100
#define BTTN_Queue_Size sizeof(uint32_t)


// Definições de Heap
#include "portable.h"

#define HEAP_BYTE_DEF 616
#define HEAP_REGION_SIZE  4 // 4 KB, ajuste conforme sua RAM
#define HEAP_SIZE  (((9+HEAP_REGION_SIZE) * 1024) -  HEAP_BYTE_DEF)// 616 bytes de folga para o heap
#define HEAP_LOW_THRESHOLD (HEAP_SIZE / 10) // 10% do heap total


static uint8_t ucHeap[HEAP_SIZE];
#define MAX_BLOCKS      5

#define FILL_BLOCK_SIZE (1024)// Tamanho de cada bloco alocado

void *pvAllocatedBlocks[MAX_BLOCKS];
int iAllocatedBlocks = 0;

typedef struct{
    uint pin;
    uint debouce_delay;
    uint command;
    
}Bttn_Params_t;

void gpio_callback(uint gpio, uint32_t events) {
    uint32_t gpio_num = gpio;
    printf("Interrupção no GPIO %d \n", gpio_num, events);
    // printf("Evento heap: %u \n", HEAP_LOW_THRESHOLD);
    xQueueSend(BTTN_Queue, &gpio_num, portMAX_DELAY);
}

void Button_task(void *pvParameters) {
    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;
    
    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin); 
    
    gpio_set_irq_enabled(params->pin,GPIO_IRQ_EDGE_RISE, true);
    
    for (;;) {
        vTaskDelay(BTTN_DELAY);
    }
    
    vTaskDelete(NULL);
}

void heap_led_task(void *pvParameters) {
    
    BlinkParams_t *params = (BlinkParams_t *)pvParameters;
    
    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);
    
    for (;;) {
        size_t free_heap = xPortGetFreeHeapSize();
        if (free_heap < HEAP_LOW_THRESHOLD) {
            gpio_put(params->led_pin, ON); // Acende o LED se heap < 10%
        } else {
            gpio_put(params->led_pin, OFF); // Apaga o LED caso contrário
        }
        
        vTaskDelay(pdMS_TO_TICKS(1000)); // 1 segundo
    }
}

void TaskAlocarMemoria(void *pvParameters) {
    uint32_t received_state;

    for (;;) {

        if (xQueueReceive(BTTN_Queue, &received_state, portMAX_DELAY) == pdPASS) {

            if (received_state == BTTN_PIN_0) {
                
                if (iAllocatedBlocks < MAX_BLOCKS) {
        
                    pvAllocatedBlocks[iAllocatedBlocks] = pvPortMalloc(FILL_BLOCK_SIZE);
        
                    if (pvAllocatedBlocks[iAllocatedBlocks] != NULL) {
                        memset(pvAllocatedBlocks[iAllocatedBlocks], 0, FILL_BLOCK_SIZE);
                        iAllocatedBlocks++;
                        printf("Memory Allocated. Blocks allocated: %d \n", iAllocatedBlocks,HEAP_LOW_THRESHOLD);
                    } else {
                        printf("Fail to allocate memory!\n");
                    }
                } else {
                    printf("Max of allocations reached.\n");
                }


            } else if (received_state == BTTN_PIN_1) {
                
                if (iAllocatedBlocks > 0) {
                    // Free the last block
                    iAllocatedBlocks--;
                    vPortFree(pvAllocatedBlocks[iAllocatedBlocks]);
                    pvAllocatedBlocks[iAllocatedBlocks] = NULL;
                    printf("Memória liberada. Blocos restantes: %d\n", iAllocatedBlocks);
                } else {
                    printf("Nenhum bloco para liberar.\n");
                }
                
                
            }
            
            while ((gpio_get(BTTN_PIN_0) | gpio_get(BTTN_PIN_1))  == 1) {
                vTaskDelay(pdMS_TO_TICKS(10));
            }
            
            vTaskDelay(pdMS_TO_TICKS(1000));
        }
        
    }
}

int main() {


    HeapRegion_t xHeapRegions[] = {
        { ucHeap, sizeof(ucHeap) },
        { NULL, 0 } 
    };
       
    BlinkParams_t led0 = {LED_0,NULL, 200, "LED 0"};
    BlinkParams_t led_heap = {LED_1,NULL, LED_Sample_Rate, "LED Heap"};
    
    Bttn_Params_t botao_1 = {BTTN_PIN_0, BTTN_DELAY,ON};
    Bttn_Params_t botao_2 = {BTTN_PIN_1, BTTN_DELAY,OFF};
    
    vPortDefineHeapRegions(xHeapRegions);
    
    BTTN_Queue = xQueueCreate(1,BTTN_Queue_Size);
    
    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);
    
    
    stdio_init_all();
    
    xTaskCreate(Button_task, "Button_SW1_Task", 256, &botao_1, 1, set_TaskHandler_Idex());
    xTaskCreate(Button_task, "Button_SW2_Task", 256, &botao_2, 1, set_TaskHandler_Idex());

    xTaskCreate(heap_led_task, "Heap_task", 256, &led_heap, 1, set_TaskHandler_Idex());
    xTaskCreate(led_task, "LED_0", 256, &led0, 2, set_TaskHandler_Idex());

    xTaskCreate(TaskAlocarMemoria, "Task_Alocar_Memoria", 256, NULL, 1, set_TaskHandler_Idex());
    xTaskCreate(cpu_heap_measure_task, "CPU_Heap_Measure_Task", 256, NULL, 1, set_TaskHandler_Idex());

    vTaskStartScheduler();

    while(1);
}
