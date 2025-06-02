#include "bttn.h"

QueueHandle_t BTTN_Queue = NULL;

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

