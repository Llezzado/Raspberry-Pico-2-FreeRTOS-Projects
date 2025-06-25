#include "adc_custom.h"

QueueHandle_t ADC_queue;

void ADC_Read_Task(void *pvParameters){
    ADC_queue = xQueueCreate(Queue_Lenght,sizeof(uint16_t));
    adc_init();
    adc_gpio_init(ADC_PIN);
    adc_select_input(ADC_INPUT);

    for (;;)
    {
        uint16_t val = adc_read();
        float voltagem = (val / ADC_RESOLUCAO) * ADC_VOLT_FER; 

        printf("ADC Val: %d \n ",val);
        //printf("Voltagem: %.2f \n ",voltagem);

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