#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include "pico/stdlib.h"

#define LED_0 25
#define LED_1 15
#define LED_2 16    
#define LED_DELAY 100

#define PRINT_DELAY 1500


typedef struct {
    uint led_pin;
    uint delay_ms;
    const char* task_name;
} BlinkParams_t;

void led_task(void *pvParameters) {
    BlinkParams_t *params = (BlinkParams_t *)pvParameters;
    
    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);
    
    while(true) {
        gpio_put(params->led_pin, 1);
        vTaskDelay(params->delay_ms);
        gpio_put(params->led_pin, 0);
        vTaskDelay(params->delay_ms);
        
        printf("Piscando LED no GPIO %d\n", params->delay_ms);
    }

    vTaskDelete( NULL );
}


void intro_task(void *pvParameters) {
    
    gpio_init(LED_1);
    gpio_set_dir(LED_1, GPIO_OUT);
    
    int timer = 3;
    const int delay = 25;
    while(timer) {
        gpio_put(LED_1, 1);
        vTaskDelay(delay);
        gpio_put(LED_1, 0);
        vTaskDelay(delay);
        timer--;
    }
    printf("Intro concluída\n");
    vTaskDelete( NULL );
}

void print_task(void *pvParameters) {
    
    while(true) {
        printf("Print test\n");
        vTaskDelay(PRINT_DELAY);
    }
    vTaskDelete( NULL );
}

int main() {
    stdio_init_all();

    BlinkParams_t led1 = {LED_1, 500, "LED 1"};
    BlinkParams_t led0 = {LED_0, 20, "LED 0"};
    BlinkParams_t led2 = {LED_2, 250, "LED 2"};
    
    xTaskCreate(intro_task, "intro_task", 256, NULL, 3, NULL);

    //xTaskCreate(print_task, "print_task", 256, NULL, 1, NULL);
    xTaskCreate(led_task, "LED_0", 256, &led0, 1, NULL);


    xTaskCreate(led_task, "LED_1", 256, &led1, 1, NULL);
    xTaskCreate(led_task, "LED_2", 256, &led2, 1, NULL);
    
    vTaskStartScheduler();

    while(1);
}
