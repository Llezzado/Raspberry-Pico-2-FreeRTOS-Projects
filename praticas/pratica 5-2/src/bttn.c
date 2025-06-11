#include "bttn.h"

void Button_task(void *pvParameters) {
    vTaskDelay(pdMS_TO_TICKS(3000));

    Bttn_Params_t *params = (Bttn_Params_t *)pvParameters;  
    uint32_t state = ON;
    gpio_init(params->pin);
    gpio_set_dir(params->pin, GPIO_IN);
    gpio_pull_up(params->pin); 
    
    gpio_set_irq_enabled(params->pin, GPIO_IRQ_EDGE_RISE, true);
    
    for (;;) {
        
        if (xSemaphoreTake(xButtonSemaphore, portMAX_DELAY) == pdTRUE) {
            vTaskDelay(pdMS_TO_TICKS(BTTN_DELAY));
            if (gpio_get(params->pin) == 1) { // Verifica se o botão está pressionado
                xQueueSend(BTTN_Queue, &state, 0);
                vTaskDelay(BTTN_DELAY / portTICK_PERIOD_MS);
                state = !state; // Inverte o estado
            }      

        }else{
            printf("Semáforo indisponível\n");
            vTaskDelay(pdMS_TO_TICKS(100));
        }

        vTaskDelay(BTTN_DELAY);
    }
    
    vTaskDelete(NULL);
}

void process_button_task(void *pvParameters) {
    vTaskDelay(pdMS_TO_TICKS(2000));
    BlinkParams_t *params = (BlinkParams_t *)pvParameters;

    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);

    uint32_t received_state;
    uint8_t togglte_state = 0;

    while (true) {

        if (xQueueReceive(BTTN_Queue, &received_state, portMAX_DELAY) == pdPASS) {
            
            // gpio_put(params->led_pin, received_state);
            gpio_put(params->led_pin, ON);
            vTaskDelay(params->delay_ms / portTICK_PERIOD_MS);
            gpio_put(params->led_pin, OFF);
            vTaskDelay(params->delay_ms / portTICK_PERIOD_MS);
        
        }
    }
}

void gpio_callback(uint gpio, uint32_t events) {
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    uint32_t gpio_num = gpio;
    xSemaphoreGiveFromISR(xButtonSemaphore, &xHigherPriorityTaskWoken);
    printf("requisições atuais  do semáforo: %lu /%i para GPIO %i \n", uxSemaphoreGetCount(xButtonSemaphore),smpr_Count,gpio_num);
    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    // xQueueSend(BTTN_Queue, &gpio_num, portMAX_DELAY);
}

void semaphore_consumer_task(void *pvParameters) {
    for (;;) {
        if (xSemaphoreTake(xButtonSemaphore, portMAX_DELAY) == pdTRUE) {
            printf("take semáforo!\n");
            vTaskDelay(pdMS_TO_TICKS(1000));
            xSemaphoreGive(xButtonSemaphore);
            printf("give semáforo\n");
            
        }
    }
}

void semaphore_status_task(void *pvParameters) {
    UBaseType_t count = uxSemaphoreGetCount(xButtonSemaphore);
    uint32_t Cnt = (int)count;
    for (;;) {
        if (xButtonSemaphore == NULL) {
            printf("Semáforo não inicializado.\n");
        } else if (smpr_Count == Cnt)
        {
            printf("Semaforo cheio, %lu\n", (unsigned long)Cnt);
        }else
         
        
        {
            UBaseType_t count = uxSemaphoreGetCount(xButtonSemaphore);
            printf("Valor atual do semáforo: %lu/%i  \r", (unsigned long)count,smpr_Count);
        }
        vTaskDelay(pdMS_TO_TICKS(BTTN_DELAY)); // Verifica a cada 1 segundo
    }
}