# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/juan/pico-sdk/tools/pioasm"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pioasm"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pioasm-install"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/tmp"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/rp2040-freertos-project/ProjectFiles/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
