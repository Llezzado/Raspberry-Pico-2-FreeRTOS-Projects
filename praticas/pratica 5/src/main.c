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

//semaforo para o led
#include "semphr.h"
SemaphoreHandle_t xButtonSemaphore;

void gpio_callback(uint gpio, uint32_t events) {
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    uint32_t gpio_num = gpio;
    printf("Interrupção no GPIO %d \n", gpio_num, events); 
    xSemaphoreGiveFromISR(xButtonSemaphore, &xHigherPriorityTaskWoken);
    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    // xQueueSend(BTTN_Queue, &gpio_num, portMAX_DELAY);
}

void Button_task(void *pvParameters) {
    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;
    uint32_t state = ON;
    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin); 
    
    gpio_set_irq_enabled(params->pin, GPIO_IRQ_EDGE_RISE, true);
    
    for (;;) {
        
        if (xSemaphoreTake(xButtonSemaphore, portMAX_DELAY) == pdTRUE) {
            printf("Semaforo livre no GPIO %d\n", params->pin);
            vTaskDelay(pdMS_TO_TICKS(params->debouce_delay));
            if (gpio_get(params->pin) == 1) { // Verifica se o botão está pressionado
                xQueueSend(BTTN_Queue, &state, 0);
            }       
        }

        //vTaskDelay(BTTN_DELAY);
    }
    
    vTaskDelete(NULL);
}

void process_button_task(void *pvParameters) {

    BlinkParams_t *params = (BlinkParams_t *)pvParameters;

    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);

    uint32_t received_state;
    uint8_t togglte_state = 0;

    while (true) {

        if (xQueueReceive(BTTN_Queue, &received_state, portMAX_DELAY) == pdPASS) {
            printf("Botão pressionado: GPIO %d\n", received_state);
            if (received_state) {
                printf("Botão pressionado\n");
                togglte_state = !togglte_state; // Toggle the state
                gpio_put(params->led_pin, togglte_state);
                vTaskDelay(params->delay_ms / portTICK_PERIOD_MS);
            }
        }
    }
}



int main() {

    BlinkParams_t led0 = {LED_0,NULL, 200, "LED 0"}; // 200
    BlinkParams_t led1 = {17,NULL, 200, "LED 0"}; // 200
    
    Bttn_Params_t botao_1 = {BTTN_PIN_0, BTTN_DELAY,ON};

    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    xButtonSemaphore = xSemaphoreCreateBinary();

    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);
    //gpio_set_irq_enabled(BTTN_PIN_0, GPIO_IRQ_EDGE_RISE, true);
    
    

    stdio_init_all();
    
    xTaskCreate(Button_task, "Button_SW1_Task", 256, &botao_1, 1, set_TaskHandler_Idex());
    
    xTaskCreate(process_button_task, "Process_Task", 256, &led1, 1, set_TaskHandler_Idex());

    xTaskCreate(led_task, "LED_0", 256, &led0, 2, set_TaskHandler_Idex());
    
    //xTaskCreate(cpu_measure_task, "CPU_Usage_task", 512, NULL,3, set_TaskHandler_Idex());
    
    vTaskStartScheduler();

    while(1);
}
