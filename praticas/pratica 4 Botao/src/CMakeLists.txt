add_executable(app
        main.c
        led.c
        cpu_monitor.c
)

target_include_directories(app PUBLIC inc)

target_link_libraries(
    app
    pico_stdlib 
    lib 
    pico_stdio_usb
    hardware_irq
)

pico_add_extra_outputs(app)
