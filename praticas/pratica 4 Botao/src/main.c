#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"

#include "queue.h"
#define Queue_Lenght 5
#define Queue_Size sizeof(int)

QueueHandle_t bttn_queue;
#define BTTN_PIN_0 15
#define BTTN_PIN_1 14

#define BTTN_DELAY 100

typedef struct{
    uint pin;
    uint debouce_delay;
    uint command;

}Bttn_Params_t;


#include "led.h"
#include "cpu_monitor.h"

void Button_task(void *pvParameters){
    
    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;

    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin); // Botão conectado ao GND (ativo em LOW)

    bttn_queue = xQueueCreate(Queue_Lenght, Queue_Size);

    uint pin = params->pin;
    uint last_state = gpio_get(pin);
    uint8_t estado_atual;
    for (;;)
    {
        estado_atual = gpio_get(pin);
        // printf("estado atual : %i \n",estado_atual);
        if (estado_atual !=  last_state )
        {
            vTaskDelay(pdMS_TO_TICKS(params->debouce_delay )); // Debounce
            estado_atual = gpio_get(pin);

            if (estado_atual != last_state) {
                last_state = estado_atual;
                
                // Envia o estado (1 = pressionado, 0 = solto) para a fila
                int button_state = (estado_atual == 0) ? 1 : 0; // Inverte se botão for pull-up
                xQueueSend(bttn_queue, &params->command, portMAX_DELAY);
            }
        }
        vTaskDelay(pdMS_TO_TICKS(10));
    }
    

    vTaskDelete(NULL);
}

void process_button_task(void *pvParameters) {
    
    BlinkParams_t *params = (BlinkParams_t *)pvParameters;

    int received_state;
    
    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);
    

    while (true) {
        // Espera receber um item da fila (bloqueante)
        if (xQueueReceive(bttn_queue, &received_state, portMAX_DELAY) == pdTRUE) {
            
            gpio_put(params->led_pin, received_state);
        
        }
        
    }
}

int main() {
    
    BlinkParams_t led2 = {LED_2,NULL, 200, "LED 1"}; // 200
    
    Bttn_Params_t botao_1 = {BTTN_PIN_0, BTTN_DELAY,ON};
    Bttn_Params_t botao_2 = {BTTN_PIN_1, BTTN_DELAY,OFF};


    
    stdio_init_all();
    
    xTaskCreate(Button_task, "Button_SW1_Task", 256, &botao_1, 1, set_TaskHandler_Idex());

    xTaskCreate(Button_task, "Button_SW2_Task", 256, &botao_2, 1, set_TaskHandler_Idex());
    
    xTaskCreate(process_button_task, "Process_Task", 256, &led2, 1, set_TaskHandler_Idex());


    // xTaskCreate(led_task, "LED_1", 256, &led1, 1, set_TaskHandler_Idex());
    
    // xTaskCreate(led_task, "LED_2", 256, &led2, 1, set_TaskHandler_Idex());
    
    xTaskCreate(cpu_measure_task, "CPU_Usage_task", 512, NULL,3, set_TaskHandler_Idex());
    
    // xTaskCreate(intro_task, "Intro_task", 256, &led1, 5, set_TaskHandler_Idex());
    

    vTaskStartScheduler();

    while(1);
}
