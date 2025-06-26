#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"
#include "hardware/uart.h"

//Cabecalhos customizados
#include "led.h"
#include "bttn.h"
#include "cpu_monitor.h"
#include "adc_custom.h"

#define BLUETHOOTH_TX_PIN 11 
#define BLUETHOOTH_RX_PIN 12
#define BAUD_RATE 9600
#define UART_ID uart0

void Bluethooth_Setup() {
    // Configura os pinos do Bluetooth
    gpio_set_function(BLUETHOOTH_TX_PIN, GPIO_FUNC_UART);
    gpio_set_function(BLUETHOOTH_RX_PIN, GPIO_FUNC_UART);

    // Inicializa o UART
    uart_init(uart0, BAUD_RATE);
    
    // Configura os pinos do UART
    uart_set_hw_flow(uart0, false, false);
    uart_set_format(uart0, 8, 1, UART_PARITY_NONE);
    
    // Configura o buffer de transmissão e recepção
    uart_set_fifo_enabled(uart0, true);
}

void bluetooth_send(const char *msg) {
    uart_puts(UART_ID, msg);
}

void Task_Bluetooth(void *pvParameters) {
    const char *message = "Hello from Bluetooth!\n";
    
    for(;;) {
        bluetooth_send(message);
        vTaskDelay(pdMS_TO_TICKS(1000)); // Envia a mensagem a cada segundo
    }
}

int main() {
    
    SemaphoreHandle_t xButtonSemaphore;
    QueueHandle_t BTTN_Queue;
    BlinkParams_t led0 = {LED_0,NULL, LED_Sample_Rate, "LED 0"};
    Acelerometro_Params_t Acelerometro_dados = {BTTN_PIN_0,task_read_rate,task_deadline_rate,0};
    
    Printf_mutex = xSemaphoreCreateMutex();
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    xButtonSemaphore = xSemaphoreCreateBinary();

    Bluethooth_Setup();

    stdio_init_all();
    
    xTaskCreate(led_task, "LED_0", 256, &led0, 4, NULL);
    xTaskCreate(Task_Bluetooth, "BT_send", 256, NULL, 3, NULL);

    vTaskStartScheduler();

    while(1);
}