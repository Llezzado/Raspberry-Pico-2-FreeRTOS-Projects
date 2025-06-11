#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include "pico/stdlib.h"

// Cabecalhos customizados
#include "led.h"
#include "bttn.h"

QueueHandle_t BTTN_Queue;
SemaphoreHandle_t xButtonSemaphore;

#define delay_smpr 1000

void semaphore_consumer_task(void *pvParameters) {
    for (;;) {
        if (xSemaphoreTake(xButtonSemaphore, delay_smpr) == pdTRUE) {
            printf("take semáforo!\n");
            vTaskDelay(pdMS_TO_TICKS(1000));
            xSemaphoreGive(xButtonSemaphore);
            printf("give semáforo\n");
            
        }else
        {
            printf("Semáforo indisponível para consume_task\n");
            vTaskDelay(pdMS_TO_TICKS(1000));
        }
        
    }
}

int main() {

    BlinkParams_t led0 = {LED_0,NULL, LED_Sample_Rate, "LED 0"};
    BlinkParams_t led1 = {LED_3,NULL, LED_Sample_Rate, "LED 1"};
    
    Bttn_Params_t botao_0 = {BTTN_PIN_0, BTTN_DELAY,ON};
    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    xButtonSemaphore = xSemaphoreCreateBinary();

    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);

    stdio_init_all();
    
    xTaskCreate(Button_task, "Button_SW1_Task", 256, &botao_0, 1, NULL);
    
    xTaskCreate(process_button_task, "Process_Task", 256, &led1, 1, NULL);

    xTaskCreate(led_task, "LED_0", 256, &led0, 2, NULL);

    xTaskCreate(semaforo_check, "smpr_check_task", 256, &xButtonSemaphore, 2, NULL);

    xTaskCreate(semaphore_consumer_task, "smpr_consume_task", 256, NULL, 3, NULL);
    
    vTaskStartScheduler();

    while(1);
}
