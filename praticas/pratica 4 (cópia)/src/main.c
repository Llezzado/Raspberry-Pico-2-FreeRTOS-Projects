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

#define Queue_Lenght 10


//pino bttn
QueueHandle_t BTTN_Queue;
#define BTTN_PIN_0 16
#define BTTN_PIN_1 17
#define BTTN_DELAY 100
#define BTTN_Queue_Size sizeof(uint32_t)

typedef struct{
    uint pin;
    uint debouce_delay;
    uint command;

}Bttn_Params_t;

void gpio_callback(uint gpio, uint32_t events) {
    uint32_t gpio_num = gpio;
    printf("Interrupção no GPIO %d \n", gpio_num, events);
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

void process_button_task(void *pvParameters) {

    BlinkParams_t *params = (BlinkParams_t *)pvParameters;

    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);

    uint32_t received_state;
    
    while (true) {
        if (xQueueReceive(BTTN_Queue, &received_state, portMAX_DELAY) == pdPASS) {
            printf("Botão pressionado: GPIO %d\n", received_state);
            if (received_state == BTTN_PIN_0) {
                printf("Botão 1 pressionado\n");
                gpio_put(params->led_pin, ON);
            } else if (received_state == BTTN_PIN_1) {
                
                printf("Botão 2 pressionado\n");
                gpio_put(params->led_pin, OFF);
            }
        }
    }
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

    // xTaskCreate(ADC_Read_Task,"ADC_0_Read_task",256,NULL,1,set_TaskHandler_Idex());
    
    // xTaskCreate(RGB_Led_task,"RGB_Led_task",256,NULL,1,set_TaskHandler_Idex());

    //xTaskCreate(led_task, "LED_0", 256, &led0, 2, set_TaskHandler_Idex());
    
    //xTaskCreate(cpu_measure_task, "CPU_Usage_task", 512, NULL,3, set_TaskHandler_Idex());
    
    vTaskStartScheduler();

    while(1);
}
