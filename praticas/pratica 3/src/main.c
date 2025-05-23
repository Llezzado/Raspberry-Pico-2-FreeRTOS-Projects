#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"

#define LED_0 25
#define LED_1 15
#define LED_2 16    

#define ON 1
#define OFF 0

#define	MAX_FREERTOS_TASKS 8

static char pcWriteBuffer[512];
//structs
typedef struct {
    uint led_pin;
    uint delay_ms;
    const char* task_name;
} BlinkParams_t;

//globals
static unsigned long int idle_tick_counter = 0UL;
TaskHandle_t	pTaskParams[MAX_FREERTOS_TASKS];  // every FreeRTOS task gets an entry in this array.

char* get_state_task(TaskHandle_t handler_task){
    eTaskState stats = eTaskGetState(handler_task);
    switch (stats)
    { 
    case eRunning:
        return "Executando";
    break;
        
    case eReady:
        return "Ready";
    break;
        
    case eBlocked:
        return "Blocked";
    break;
        
    case eSuspended:
        return "suspended";
        break;
        
        case eDeleted:
        return "apagado";
        break;
    
    default:
        return "Desconhecido";
    break;
    }
}

void vApplicationIdleHook(void){
    unsigned long int tick = xTaskGetTickCount();
    while (xTaskGetTickCount() == tick);
    idle_tick_counter++;
}

void cpu_measure_task(void *pvParameters) {
    unsigned long int idle_tick_last = 0, ticks;
	while(1){
        // wait 3 seconds
		vTaskDelay(3000/portTICK_PERIOD_MS);
        
        
		if (idle_tick_counter > idle_tick_last){
            ticks = idle_tick_counter - idle_tick_last;
        }
		else{
            ticks = 0xFFFFFFFF - idle_tick_last + idle_tick_counter;
        }
        
		ticks /= uxTaskGetNumberOfTasks(); //num de tasks definidas
        
		/* Printing idle ticks per second */
		printf("%ld idle ticks per second (out of %ld) - %i tasks - ", ticks, configTICK_RATE_HZ, uxTaskGetNumberOfTasks());
        
		/* calc and print CPU usage */
		ticks = (configTICK_RATE_HZ - ticks)/10;
		printf("CPU usage: %d%% \n", ticks);
        
		idle_tick_last = idle_tick_counter;
        
        
        //addons
        printf("======================================\n");
        
        memset(pcWriteBuffer, 0, sizeof(pcWriteBuffer));
        
        // Obtém estatísticas formatadas
        vTaskGetRunTimeStats(pcWriteBuffer);
        // Limpa console e exibe estatísticas
        printf("Nome =========== Ticks ======= Consumo\n");
        printf("%s", pcWriteBuffer);
        printf("======Prioridades=======Estado========\n");
        for (size_t i = 0; i < uxTaskGetNumberOfTasks() - 2; i++)
        {
            UBaseType_t type_priority =uxTaskPriorityGet(pTaskParams[i]); 
            char* type_name = pcTaskGetName(pTaskParams[i]); 

            printf("%s - %u - %s \n",type_name ,type_priority,get_state_task(pTaskParams[i]));
        }
	}



    vTaskDelete( NULL );
}




void led_task(void *pvParameters) //parametro utiliza  da strucct BlinkParams_t
{
    BlinkParams_t *params = (BlinkParams_t *)pvParameters;
    
    gpio_init(params->led_pin);
    gpio_set_dir(params->led_pin , GPIO_OUT);
    
    while(true) {
        gpio_put(params->led_pin, ON);
        vTaskDelay(params->delay_ms / portTICK_PERIOD_MS);
        gpio_put(params->led_pin, OFF);
        vTaskDelay(params->delay_ms / portTICK_PERIOD_MS);
        
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
        vTaskDelay(delay*100);
        timer--;
    }
    printf("Intro concluída\n");
    vTaskDelete( NULL );
}

void Pulling_CPU_Usage_task(void *pvParameters){
    uint32_t i,j;

    for (;;) {
        
        for (i = 0,j = 0; i < 100000; i++){j*i;};

        vTaskDelay(100 / portTICK_PERIOD_MS);
    }
}

int main() {
    
    stdio_init_all();
    uint8_t cnt = 0; 
    BlinkParams_t led0 = {LED_0, 100, "LED 0"}; // 100
    BlinkParams_t led1 = {LED_1, 200, "LED 1"}; // 200
    BlinkParams_t led2 = {LED_2, 500, "LED 2"}; // 500
    
    
    xTaskCreate(led_task, "LED_1", 256, &led1, 1, &pTaskParams[cnt]);cnt++;
    
    xTaskCreate(led_task, "LED_2", 256, &led2, 2, &pTaskParams[cnt]);cnt++;
    
    xTaskCreate(cpu_measure_task, "CPU_Usage_task", 512, NULL,3, &pTaskParams[cnt]);cnt++;
    
    xTaskCreate(Pulling_CPU_Usage_task, "CPU_Use_Example", 256, NULL,4, &pTaskParams[cnt]);cnt++;
    
    xTaskCreate(intro_task, "Intro_task", 256, &led1, 5, &pTaskParams[cnt]);cnt++;
    
    vTaskStartScheduler();

    while(1);
}
