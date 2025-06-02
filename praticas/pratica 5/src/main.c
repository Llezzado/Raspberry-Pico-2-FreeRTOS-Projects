#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"

#include "led.h"
#include "queue.h"
#include "cpu_monitor.h"
#include "adc_custom.h"

#include "bttn.h"
#define Queue_Lenght 10

// semaforo
#include "semphr.h"
#define smp_delay 1000



void gpio_callback(uint gpio, uint32_t events) {
    uint32_t gpio_num = gpio;
    printf("Interrupção no GPIO %d \n", gpio_num, events);
    xQueueSend(BTTN_Queue, &gpio_num, portMAX_DELAY);
}

SemaphoreHandle_t bttn_semaphore;

void bttn_semaforo_task(void *pvParameters) {

    delay = pdMS_TO_TICKS(smp_delay);

}

int main() {

    BlinkParams_t led0 = {LED_0,NULL, 200, "LED 0"}; // 200
    
    Bttn_Params_t botao_1 = {BTTN_PIN_0, BTTN_DELAY,ON};
    Bttn_Params_t botao_2 = {BTTN_PIN_1, BTTN_DELAY,OFF};

    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);

    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);
    
    stdio_init_all();
    
    xTaskCreate(Button_task, "Button_SW1_Task", 256, &botao_1, 1, set_TaskHandler_Idex());
    
    xTaskCreate(Button_task, "Button_SW2_Task", 256, &botao_2, 1, set_TaskHandler_Idex());

    xTaskCreate(process_button_task, "Process_Task", 256, &led0, 1, set_TaskHandler_Idex());

    xTaskCreate(ADC_Read_Task,"ADC_0_Read_task",256,NULL,1,set_TaskHandler_Idex());
    
    xTaskCreate(RGB_Led_task,"RGB_Led_task",256,NULL,1,set_TaskHandler_Idex());

    vTaskStartScheduler();

    while(1);
}
