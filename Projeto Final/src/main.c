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

#define BLUETHOOTH_TX_PIN 0
#define BLUETHOOTH_RX_PIN 1
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

        vTaskDelay(pdMS_TO_TICKS(5000)); // Envia a mensagem a cada segundo
    }
}

void Task_USB_Terminal(void *pvParameters) {
    char buffer[64];
    int idx = 0;

    for (;;) {
        int c = getchar_timeout_us(0); // Lê do terminal USB, não bloqueante
        if (c != PICO_ERROR_TIMEOUT) {
            if (c == '\n' || idx >= (int)(sizeof(buffer) - 1)) {
                buffer[idx] = '\0';
                printf("Eco USB: %s\n", buffer); // Imprime de volta no terminal USB
                idx = 0;
            } else if (c != '\r') {
                buffer[idx++] = (char)c;
            }
        }
        vTaskDelay(pdMS_TO_TICKS(10));
    }
}

void Task_Bluetooth_Receive(void *pvParameters) {
    char buffer[64];
    int idx = 0;

    for (;;) {
        // Lê caracteres enquanto houver dados na UART
        while (uart_is_readable(UART_ID)) {
            char c = uart_getc(UART_ID);

            // Armazena no buffer até '\n' ou buffer cheio
            if (c == '\n' || idx >= (int)(sizeof(buffer) - 1)) {
                buffer[idx] = '\0';
                printf("Recebido via Bluetooth: %s\n", buffer);
                idx = 0; // Reinicia o buffer
            } else if (c != '\r') {
                buffer[idx++] = c;
            }
        }
        vTaskDelay(pdMS_TO_TICKS(10)); // Pequeno delay para não travar a CPU
    }
}

int main() {
    
    SemaphoreHandle_t xButtonSemaphore;
    QueueHandle_t BTTN_Queue;
    BlinkParams_t led0 = {LED_0,NULL, LED_Sample_Rate, "LED 0"};
    
    Printf_mutex = xSemaphoreCreateMutex();
    BTTN_Queue = xQueueCreate(BTTN_Queue_Size,BTTN_Queue_Size);
    xButtonSemaphore = xSemaphoreCreateBinary();

    stdio_init_all();

    Bluethooth_Setup();

    xTaskCreate(led_task, "LED_0", 256, &led0, 4, NULL);
    xTaskCreate(Task_Bluetooth, "BT_send", 256, NULL, 3, NULL);
    xTaskCreate(Task_Bluetooth_Receive, "BT_receive", 256, NULL, 3, NULL);
    xTaskCreate(Task_USB_Terminal, "USB_term", 256, NULL, 2, NULL);

    vTaskStartScheduler();

    while(1);
}