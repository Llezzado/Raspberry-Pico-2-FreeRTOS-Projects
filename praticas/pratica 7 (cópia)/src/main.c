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
#define delay_smpr 1000

static uint8_t ucHeap[HEAP_REGION_SIZE];

void heap_led_task(void *pvParameters) {
    
    BlinkParams_t *params = (BlinkParams_t *)pvParameters;
    
    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);
    
    for (;;) {
        size_t free_heap = xPortGetFreeHeapSize();
        // printf("Heap livre atual led: %u bytes\n", (unsigned)free_heap);

        if (free_heap < HEAP_LOW_THRESHOLD) {
            gpio_put(params->led_pin, ON); // Acende o LED se heap < 10%
        } else {
            gpio_put(params->led_pin, OFF); // Apaga o LED caso contrário
        }

        vTaskDelay(pdMS_TO_TICKS(1000)); // 1 segundo
    }
}

void read_button_heap_task(void *pvParameters) {

    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;
    uint32_t state = ON;

    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin);

    gpio_set_irq_enabled_with_callback(params->pin, GPIO_IRQ_EDGE_RISE, true, gpio_callback);

    for (;;) {
        if (xSemaphoreTake(xButtonSemaphore, portMAX_DELAY) == pdTRUE) {
            vTaskDelay(pdMS_TO_TICKS(params->debouce_delay));
            if (gpio_get(params->pin) == 1) { // Verifica se o botão está pressionado
                xQueueSend(BTTN_Queue, &state, 0);
            }
        }
    }
}

#define MAX_BLOCKS      10
#define FILL_BLOCK_SIZE 256
void *pvAllocatedBlocks[MAX_BLOCKS];
int iAllocatedBlocks = 0;

void TaskAlocarMemoria(void *pvParameters) {
    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;
    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin); 

    for (;;) {
        if (gpio_get(params->pin) == 1) {
            printf("Button pressed, allocating memory...\n");
            if (iAllocatedBlocks < MAX_BLOCKS) {

                pvAllocatedBlocks[iAllocatedBlocks] = pvPortMalloc(FILL_BLOCK_SIZE);

                if (pvAllocatedBlocks[iAllocatedBlocks] != NULL) {
                    memset(pvAllocatedBlocks[iAllocatedBlocks], 0, FILL_BLOCK_SIZE);
                    iAllocatedBlocks++;
                    printf("Memory Allocated. Blocks allocated: %d\n", iAllocatedBlocks);
                } else {
                    printf("Fail to allocate memory!\n");
                }
            } else {
                printf("Max of allocations reached.\n");
            }

            // Aguarda soltar o botão
            while (gpio_get(params->pin) == 1) {
                vTaskDelay(pdMS_TO_TICKS(10));
            }
        }
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}

void TaskLiberarMemoria(void *pvParameters) {
    
    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;
    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin);

    while(1) {
        
        if (gpio_get(params->pin) == 1) {
            if (iAllocatedBlocks > 0) {
                // Free the last block
                iAllocatedBlocks--;
                vPortFree(pvAllocatedBlocks[iAllocatedBlocks]);
                pvAllocatedBlocks[iAllocatedBlocks] = NULL;
                printf("Memória liberada. Blocos restantes: %d\n", iAllocatedBlocks);
            } else {
                printf("Nenhum bloco para liberar.\n");
            }

            // Wait to liberation a button
            while(gpio_get(params->pin) == 1) {
                vTaskDelay(pdMS_TO_TICKS(10));
            }
        }

        vTaskDelay(pdMS_TO_TICKS(100));
    }
}

int main() {

    HeapRegion_t xHeapRegions[] = {
        { ucHeap, sizeof(ucHeap) },
        { NULL,   0 } // Fim da lista
    };

    BlinkParams_t led0 = {LED_0,NULL, LED_Sample_Rate, "LED 0"};
    BlinkParams_t led_heap = {LED_1,NULL, LED_Sample_Rate, "LED Heap"};
    
    Bttn_Params_t botao_0 = {BTTN_PIN_0, BTTN_DELAY,ON};
    Bttn_Params_t botao_1 = {BTTN_PIN_1, BTTN_DELAY,ON};
    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size, sizeof(uint32_t));
    xButtonSemaphore = xSemaphoreCreateBinary();
    
    vPortDefineHeapRegions(xHeapRegions);

    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);

    stdio_init_all();

    xTaskCreate(led_task, "LED_0", 256, &led0, 2, set_TaskHandler_Idex());
    xTaskCreate(heap_led_task, "LED_Heap", 256, &led_heap, 2, set_TaskHandler_Idex());
    xTaskCreate(cpu_heap_measure_task, "CPU_Measure", 256, NULL, 1, set_TaskHandler_Idex());
    xTaskCreate(TaskAlocarMemoria, "Task_Alocar_Memoria", 256, &botao_0, 1, set_TaskHandler_Idex());
    xTaskCreate(TaskLiberarMemoria, "Task_Liberar_Memoria", 256, &botao_1, 1, set_TaskHandler_Idex());

    vTaskStartScheduler();

    while(1);
}
