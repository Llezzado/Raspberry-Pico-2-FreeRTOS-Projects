cmake_minimum_required(VERSION 3.12)

set(PICO_BOARD pico2 CACHE STRING "Board type")

include(pico_sdk_import.cmake)

project(Pico-FreeRTOS)

pico_sdk_init()

add_subdirectory(freertos)
add_subdirectory(ProjectFiles)
