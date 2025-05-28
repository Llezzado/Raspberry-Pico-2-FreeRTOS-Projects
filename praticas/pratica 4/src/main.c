#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"
#include "queue.h"
#define Queue_Lenght 5
#define Queue_Size sizeof(int)

#define BTTN_PIN_0 15
#define BTTN_PIN_1 14

#define BTTN_DELAY 100

//pino adc
QueueHandle_t ADC_queue;
#define ADC_PIN 26
#define ADC_INPUT 0
#define ADC_VOLT_FER 3.3
#define ADC_DELAY 300

//RGB LED
#define RBG_PIN_R 13
#define RBG_PIN_G 14
#define RBG_PIN_B 15

typedef struct{
    uint pin;
    uint debouce_delay;
    uint command;

}Bttn_Params_t;


#include "led.h"
#include "cpu_monitor.h"

void ADC_Read_Task(void *pvParameters){

    adc_init();
    adc_gpio_init(ADC_PIN);
    adc_select_input(ADC_INPUT);

    for (;;)
    {
        uint16_t val = adc_read();


        printf("ADC Val: %d \n ",val);

        xQueueSend(ADC_queue,&val,portMAX_DELAY);

        vTaskDelay(ADC_DELAY);
    }
    
}

void RGB_Led_task(void *pvParameters){

    gpio_init(RBG_PIN_R);
    gpio_init(RBG_PIN_G);
    gpio_init(RBG_PIN_B);

    gpio_set_dir(RBG_PIN_R, GPIO_OUT);
    gpio_set_dir(RBG_PIN_G, GPIO_OUT);
    gpio_set_dir(RBG_PIN_B, GPIO_OUT);
    

    uint16_t valor = 0;
    for (;;)
    {
        if (xQueueReceive(ADC_queue, &valor, portMAX_DELAY) == pdPASS)
        {
            if (valor > 0 && valor <= 1000)
            {
                gpio_put(RBG_PIN_R, OFF);
                gpio_put(RBG_PIN_G, OFF);
                gpio_put(RBG_PIN_B, ON);
            }else if(valor > 1000 && valor <= 2400){
                gpio_put(RBG_PIN_R, OFF);
                gpio_put(RBG_PIN_G, ON);
                gpio_put(RBG_PIN_B, OFF);
            }else if(valor > 2400){
                gpio_put(RBG_PIN_R, ON);
                gpio_put(RBG_PIN_G, OFF);
                gpio_put(RBG_PIN_B, OFF);
            }else{
                gpio_put(RBG_PIN_R, OFF);
                gpio_put(RBG_PIN_G, OFF);
                gpio_put(RBG_PIN_B, OFF);
            }
            
        }
        vTaskDelay(ADC_DELAY);
    }
    
}

int main() {

    BlinkParams_t led0 = {LED_0,NULL, 200, "LED 0"}; // 200
    
    Bttn_Params_t botao_1 = {BTTN_PIN_0, BTTN_DELAY,ON};
    Bttn_Params_t botao_2 = {BTTN_PIN_1, BTTN_DELAY,OFF};
    ADC_queue = xQueueCreate(Queue_Lenght,sizeof(uint16_t));

    
    stdio_init_all();
    
    

    xTaskCreate(ADC_Read_Task,"ADC_0_Read_task",256,NULL,1,set_TaskHandler_Idex());
    
    xTaskCreate(RGB_Led_task,"RGB_Led_task",256,NULL,1,set_TaskHandler_Idex());

    xTaskCreate(led_task, "LED_0", 256, &led0, 2, set_TaskHandler_Idex());
    
    //xTaskCreate(cpu_measure_task, "CPU_Usage_task", 512, NULL,3, set_TaskHandler_Idex());
    
    vTaskStartScheduler();

    while(1);
}
