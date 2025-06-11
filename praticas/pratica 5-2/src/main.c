#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"

#include "led.h"
#include "bttn.h"

QueueHandle_t BTTN_Queue;
SemaphoreHandle_t xButtonSemaphore;

int main() {

    BlinkParams_t led0 = {LED_0,NULL, 200, "LED 0"}; // 200
    BlinkParams_t led1 = {LED_3,NULL, 500, "LED 0"}; // 200
    
    Bttn_Params_t botao_1 = {BTTN_PIN_0, BTTN_DELAY,ON};
    // Bttn_Params_t botao_2 = {BTTN_PIN_1, BTTN_DELAY,ON};

    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);

    xButtonSemaphore = xSemaphoreCreateCounting(smpr_Count, 0);

    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);

    stdio_init_all();
    
    xTaskCreate(Button_task, "Button_SW1_Task", 256, &botao_1, 2, NULL);
    // xTaskCreate(Button_task, "Button_SW2_Task", 256, &botao_2, 2, NULL);
    
    xTaskCreate(process_button_task, "Process_Task", 256, &led1, 3, NULL);

    xTaskCreate(led_task, "LED_0", 256, &led0, 1, NULL);
    
    xTaskCreate(semaphore_status_task, "SemStatus", 256, NULL, 1, NULL);
    
    xTaskCreate(semaphore_consumer_task, "Sem_consume", 256, NULL, 1, NULL);

    vTaskStartScheduler();

    while(1);
}
