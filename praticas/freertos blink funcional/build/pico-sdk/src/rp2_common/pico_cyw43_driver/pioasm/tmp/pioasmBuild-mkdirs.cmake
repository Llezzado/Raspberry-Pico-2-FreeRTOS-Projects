# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/juan/pico-sdk/tools/pioasm"
  "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pioasm"
  "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pioasm-install"
  "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/tmp"
  "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp"
  "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src"
  "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/mnt/meu_vol/ufc/2025.1/rtos/praticas/freertos blink funcional/build/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
