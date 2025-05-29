#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "queue.h"
#include "hardware/irq.h"
#include "cpu_monitor.h"
#include "led.h"

#define Queue_Lenght 10
#define Queue_Size sizeof(uint32_t)

QueueHandle_t bttn_queue;

#define BTTN_PIN_0 16
#define BTTN_PIN_1 17
#define BTTN_DELAY 100

typedef struct {
    uint pin;
    uint debouce_delay;
    uint command;
} Bttn_Params_t;

void gpio_callback(uint gpio, uint32_t events) {
    uint32_t gpio_num = gpio;
    printf("Interrupção no GPIO %d \n", gpio_num, events);
    xQueueSend(bttn_queue, &gpio_num, portMAX_DELAY);
}

void Button_task(void *pvParameters) {
    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;
    
    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin); 
    
    gpio_set_irq_enabled(params->pin, GPIO_IRQ_EDGE_FALL | GPIO_IRQ_EDGE_RISE, true);
    
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
        if (xQueueReceive(bttn_queue, &received_state, portMAX_DELAY) == pdPASS) {
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
    stdio_init_all();
    
    BlinkParams_t led0 = {LED_0,NULL, 200, "LED 0"};
    
    bttn_queue = xQueueCreate(Queue_Lenght, Queue_Size);
    
    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);
    
    // Parâmetros para os botões
    Bttn_Params_t botao_1 = {BTTN_PIN_0, BTTN_DELAY, ON};
    Bttn_Params_t botao_2 = {BTTN_PIN_1, BTTN_DELAY, OFF};
    
    // Cria as tasks
    xTaskCreate(Button_task, "Button_SW1_Task", 256, &botao_1, 1, NULL);
    xTaskCreate(Button_task, "Button_SW2_Task", 256, &botao_2, 1, NULL);
    xTaskCreate(process_button_task, "Process_Task", 256, &led0, 1, NULL);
    
    vTaskStartScheduler();

    while(1);
}