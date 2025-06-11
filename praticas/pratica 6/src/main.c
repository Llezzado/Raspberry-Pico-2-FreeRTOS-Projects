#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include "pico/stdlib.h"

// Cabecalhos customizados
#include "led.h"
#include "bttn.h"
#include "cpu_monitor.h"
#include "adc_custom.h"

QueueHandle_t BTTN_Queue;
SemaphoreHandle_t xButtonSemaphore;

//informações da pratica 6:
#include "semphr.h"
#define task_read_rate 50 // ms

typedef struct {
    uint gpio;
    uint delay_ms;
    uint deadline_ms;
    uint valor;
} Acelerometro_Params_t;

Acelerometro_Params_t Acelerometro_dados = {BTTN_PIN_0,task_read_rate,1000,0};

SemaphoreHandle_t Printf_mutex;

void acelerometro_read_task(void *pvParameters) {
    Acelerometro_Params_t *params = (Acelerometro_Params_t *)pvParameters;

    gpio_init(params->gpio);
    gpio_set_dir(params->gpio, GPIO_IN);
    gpio_pull_up(params->gpio); 

    for(;;){

        if (xSemaphoreTake(Printf_mutex, params->deadline_ms / portTICK_PERIOD_MS)){
            
            params->valor = gpio_get(params->gpio);
            xSemaphoreGive(Printf_mutex);
        }else
        {
            printf("Acelerometro timeout: %d ms\n", params->deadline_ms);
            params->valor = 0; // Reset value on timeout
        }
        

        vTaskDelay(pdMS_TO_TICKS(params->delay_ms));
    
    }
}

void acelerometro_print_task(void *pvParameters) {
    Acelerometro_Params_t *params = (Acelerometro_Params_t *)pvParameters;

    for(;;){
        if (xSemaphoreTake(Printf_mutex, params->deadline_ms / portTICK_PERIOD_MS)){
            printf("Acelerometro valor: %d \n", params->valor);
            xSemaphoreGive(Printf_mutex);
        }else{
            printf("Acelerometro timeout: %d ms\n", params->deadline_ms);
        }
        vTaskDelay(pdMS_TO_TICKS(params->delay_ms));
    }
}


int main() {

    Printf_mutex = xSemaphoreCreateMutex();

    BlinkParams_t led0 = {LED_0,NULL, LED_Sample_Rate, "LED 0"};
    BlinkParams_t led1 = {LED_3,NULL, LED_Sample_Rate, "LED 1"};
    
    Bttn_Params_t botao_0 = {BTTN_PIN_0, BTTN_DELAY,ON};
    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    xButtonSemaphore = xSemaphoreCreateBinary();

    gpio_set_irq_callback(gpio_callback);
    irq_set_enabled(IO_IRQ_BANK0, true);

    stdio_init_all();
    
    xTaskCreate(led_task, "LED_0", 256, &led0, 3, NULL);
    xTaskCreate(acelerometro_read_task, "Button_SW1_Task", 256, &Acelerometro_dados, 2, NULL);
    xTaskCreate(acelerometro_print_task, "Button_SW1_Print_Task", 256, &Acelerometro_dados, 1, NULL);



    vTaskStartScheduler();

    while(1);
}
