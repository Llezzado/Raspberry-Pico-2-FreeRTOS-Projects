#include <stdio.h>
#include "pico/stdlib.h"

#define GPIO_ON 1
#define GPIO_OFF 0
#define GPIO_LED 25



int main()
{
    stdio_init_all();
    
    gpio_init(GPIO_LED);
	gpio_set_dir(GPIO_LED,GPIO_ON);
	

    while (true) {
        gpio_put(GPIO_LED,GPIO_ON);
        sleep_ms(250);
        gpio_put(GPIO_LED,GPIO_OFF);
        sleep_ms(250);
        printf("Hello, world!\n");
    }
}
