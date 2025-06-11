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
#include "hardware/adc.h"

#define task_read_rate 50 // ms

typedef struct {
    uint gpio;
    uint delay_ms;
    uint deadline_ms;
    uint16_t valor;
} Acelerometro_Params_t;

Acelerometro_Params_t Acelerometro_dados = {BTTN_PIN_0,task_read_rate,50,0};

SemaphoreHandle_t Printf_mutex;

void acelerometro_read_task(void *pvParameters) {
    Acelerometro_Params_t *params = (Acelerometro_Params_t *)pvParameters;
    for(;;){

        printf("Leitura do acelerometro sendo executada.. \n");

        if (xSemaphoreTake(Printf_mutex, params->deadline_ms / portTICK_PERIOD_MS)){
            params->valor = adc_read();
            //vTaskDelay(pdMS_TO_TICKS(10)); // Small delay to a
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
            params->valor = 0; // Reset value after printing
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
    
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    xButtonSemaphore = xSemaphoreCreateBinary();

    adc_init();
    adc_gpio_init(ADC_PIN);
    adc_select_input(ADC_INPUT);

    stdio_init_all();
    
    xTaskCreate(led_task, "LED_0", 256, &led0, 3, NULL);

    xTaskCreate(acelerometro_read_task, "Acelerometro_read_mutex", 256, &Acelerometro_dados, 2, NULL);
    xTaskCreate(acelerometro_print_task, "Acelerometro_print_mutex", 256, &Acelerometro_dados, 1, NULL);



    vTaskStartScheduler();

    while(1);
}