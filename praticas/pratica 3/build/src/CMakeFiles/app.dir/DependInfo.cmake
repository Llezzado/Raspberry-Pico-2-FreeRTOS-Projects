
# Consider dependencies only in project.
set(CMAKE_DEPENDS_IN_PROJECT_ONLY OFF)

# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "ASM"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_ASM
  "/home/juan/pico-sdk/src/rp2_common/hardware_irq/irq_handler_chain.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_irq/irq_handler_chain.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_bit_ops/bit_ops_aeabi.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_bit_ops/bit_ops_aeabi.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_crt0/crt0.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_crt0/crt0.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_double/double_aeabi_dcp.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_double/double_aeabi_dcp.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_double/double_conv_m33.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_double/double_conv_m33.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_double/double_fma_dcp.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_double/double_fma_dcp.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_double/double_sci_m33.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_double/double_sci_m33.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_float/float_common_m33.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_float/float_common_m33.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_float/float_conv32_vfp.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_float/float_conv32_vfp.S.o"
  "/home/juan/pico-sdk/src/rp2_common/pico_float/float_sci_m33_vfp.S" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/build/src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_float/float_sci_m33_vfp.S.o"
  )

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_ASM
  "CFG_TUSB_DEBUG=0"
  "CFG_TUSB_MCU=OPT_MCU_RP2040"
  "CFG_TUSB_OS=OPT_OS_PICO"
  "LIB_BOOT_STAGE2_HEADERS=1"
  "LIB_PICO_ATOMIC=1"
  "LIB_PICO_BIT_OPS=1"
  "LIB_PICO_BIT_OPS_PICO=1"
  "LIB_PICO_CLIB_INTERFACE=1"
  "LIB_PICO_CRT0=1"
  "LIB_PICO_CXX_OPTIONS=1"
  "LIB_PICO_DIVIDER=1"
  "LIB_PICO_DIVIDER_COMPILER=1"
  "LIB_PICO_DOUBLE=1"
  "LIB_PICO_DOUBLE_PICO=1"
  "LIB_PICO_FIX_RP2040_USB_DEVICE_ENUMERATION=1"
  "LIB_PICO_FLASH=1"
  "LIB_PICO_FLOAT=1"
  "LIB_PICO_FLOAT_PICO=1"
  "LIB_PICO_FLOAT_PICO_VFP=1"
  "LIB_PICO_INT64_OPS=1"
  "LIB_PICO_INT64_OPS_COMPILER=1"
  "LIB_PICO_MALLOC=1"
  "LIB_PICO_MEM_OPS=1"
  "LIB_PICO_MEM_OPS_COMPILER=1"
  "LIB_PICO_NEWLIB_INTERFACE=1"
  "LIB_PICO_PLATFORM=1"
  "LIB_PICO_PLATFORM_COMPILER=1"
  "LIB_PICO_PLATFORM_PANIC=1"
  "LIB_PICO_PLATFORM_SECTIONS=1"
  "LIB_PICO_PRINTF=1"
  "LIB_PICO_PRINTF_PICO=1"
  "LIB_PICO_RUNTIME=1"
  "LIB_PICO_RUNTIME_INIT=1"
  "LIB_PICO_STANDARD_BINARY_INFO=1"
  "LIB_PICO_STANDARD_LINK=1"
  "LIB_PICO_STDIO=1"
  "LIB_PICO_STDIO_UART=1"
  "LIB_PICO_STDIO_USB=1"
  "LIB_PICO_STDLIB=1"
  "LIB_PICO_SYNC=1"
  "LIB_PICO_SYNC_CRITICAL_SECTION=1"
  "LIB_PICO_SYNC_MUTEX=1"
  "LIB_PICO_SYNC_SEM=1"
  "LIB_PICO_TIME=1"
  "LIB_PICO_TIME_ADAPTER=1"
  "LIB_PICO_UNIQUE_ID=1"
  "LIB_PICO_UTIL=1"
  "PICO_32BIT=1"
  "PICO_BOARD=\"pico2\""
  "PICO_BUILD=1"
  "PICO_CMAKE_BUILD_TYPE=\"Release\""
  "PICO_COPY_TO_RAM=0"
  "PICO_CXX_ENABLE_EXCEPTIONS=0"
  "PICO_NO_FLASH=0"
  "PICO_NO_HARDWARE=0"
  "PICO_ON_DEVICE=1"
  "PICO_RP2040_USB_DEVICE_UFRAME_FIX=1"
  "PICO_RP2350=1"
  "PICO_TARGET_NAME=\"app\""
  "PICO_USE_BLOCKED_RAM=0"
  )

# The include file search paths:
set(CMAKE_ASM_TARGET_INCLUDE_PATH
  "/home/juan/pico-sdk/src/rp2_common/pico_atomic/include"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/lib/."
  "/home/juan/FreeRTOS-Kernel/portable/ThirdParty/GCC/RP2350_ARM_NTZ"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/lib/FreeRTOS-Kernel/include"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/lib/FreeRTOS-Kernel/portable/GCC/ARM_CM0"
  "/home/juan/pico-sdk/lib/tinyusb/src"
  "/home/juan/pico-sdk/src/common/pico_stdlib_headers/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_gpio/include"
  "/home/juan/pico-sdk/src/common/pico_base_headers/include"
  "generated/pico_base"
  "/home/juan/pico-sdk/src/boards/include"
  "/home/juan/pico-sdk/src/rp2350/pico_platform/include"
  "/home/juan/pico-sdk/src/rp2350/hardware_regs/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_base/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_platform_compiler/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_platform_panic/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_platform_sections/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_dcp/include"
  "/home/juan/pico-sdk/src/rp2350/hardware_structs/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_rcp/include"
  "/home/juan/pico-sdk/src/common/hardware_claim/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_sync/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_sync_spin_lock/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_irq/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_uart/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_resets/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_clocks/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_pll/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_vreg/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_watchdog/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_ticks/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_bootrom/include"
  "/home/juan/pico-sdk/src/common/boot_picoboot_headers/include"
  "/home/juan/pico-sdk/src/rp2_common/boot_bootrom_headers/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_boot_lock/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_flash/include"
  "/home/juan/pico-sdk/src/common/pico_time/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_timer/include"
  "/home/juan/pico-sdk/src/common/pico_sync/include"
  "/home/juan/pico-sdk/src/common/pico_util/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_time_adapter/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_xosc/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_divider/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_runtime/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/include"
  "/home/juan/pico-sdk/src/common/pico_bit_ops_headers/include"
  "/home/juan/pico-sdk/src/common/pico_divider_headers/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_double/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_float/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_malloc/include"
  "/home/juan/pico-sdk/src/common/pico_binary_info/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_printf/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio_uart/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_multicore/include"
  "/home/juan/pico-sdk/src/common/boot_picobin_headers/include"
  "/home/juan/pico-sdk/src/rp2350/boot_stage2/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_unique_id/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_flash/include"
  "/home/juan/pico-sdk/src/rp2_common/hardware_xip_cache/include"
  "/home/juan/pico-sdk/src/common/pico_usb_reset_interface_headers/include"
  "/home/juan/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include"
  )

# The set of dependency files which are needed:
set(CMAKE_DEPENDS_DEPENDENCY_FILES
  "/home/juan/pico-sdk/lib/tinyusb/src/class/audio/audio_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/audio/audio_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/audio/audio_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/cdc/cdc_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/cdc/cdc_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/cdc/cdc_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/dfu/dfu_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/dfu/dfu_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/dfu/dfu_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/dfu/dfu_rt_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/dfu/dfu_rt_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/dfu/dfu_rt_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/hid/hid_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/hid/hid_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/hid/hid_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/midi/midi_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/midi/midi_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/midi/midi_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/msc/msc_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/msc/msc_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/msc/msc_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/net/ecm_rndis_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/net/ecm_rndis_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/net/ecm_rndis_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/net/ncm_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/net/ncm_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/net/ncm_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/usbtmc/usbtmc_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/usbtmc/usbtmc_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/usbtmc/usbtmc_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/vendor/vendor_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/vendor/vendor_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/vendor/vendor_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/class/video/video_device.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/video/video_device.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/class/video/video_device.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/common/tusb_fifo.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/common/tusb_fifo.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/common/tusb_fifo.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/device/usbd.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/device/usbd.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/device/usbd.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/device/usbd_control.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/device/usbd_control.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/device/usbd_control.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/portable/raspberrypi/rp2040/dcd_rp2040.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/portable/raspberrypi/rp2040/dcd_rp2040.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/portable/raspberrypi/rp2040/dcd_rp2040.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/portable/raspberrypi/rp2040/rp2040_usb.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/portable/raspberrypi/rp2040/rp2040_usb.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/portable/raspberrypi/rp2040/rp2040_usb.c.o.d"
  "/home/juan/pico-sdk/lib/tinyusb/src/tusb.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/tusb.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/lib/tinyusb/src/tusb.c.o.d"
  "/home/juan/pico-sdk/src/common/hardware_claim/claim.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/hardware_claim/claim.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/hardware_claim/claim.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_sync/critical_section.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/critical_section.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/critical_section.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_sync/lock_core.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/lock_core.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/lock_core.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_sync/mutex.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/mutex.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/mutex.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_sync/sem.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/sem.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_sync/sem.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_time/time.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_time/time.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_time/time.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_time/timeout_helper.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_time/timeout_helper.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_time/timeout_helper.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_util/datetime.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_util/datetime.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_util/datetime.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_util/pheap.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_util/pheap.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_util/pheap.c.o.d"
  "/home/juan/pico-sdk/src/common/pico_util/queue.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_util/queue.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/common/pico_util/queue.c.o.d"
  "/home/juan/pico-sdk/src/rp2350/pico_platform/platform.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2350/pico_platform/platform.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2350/pico_platform/platform.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_boot_lock/boot_lock.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_boot_lock/boot_lock.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_boot_lock/boot_lock.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_clocks/clocks.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_clocks/clocks.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_clocks/clocks.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_divider/divider.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_divider/divider.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_divider/divider.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_flash/flash.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_flash/flash.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_flash/flash.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_gpio/gpio.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_gpio/gpio.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_gpio/gpio.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_irq/irq.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_irq/irq.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_irq/irq.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_pll/pll.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_pll/pll.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_pll/pll.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_sync/sync.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_sync/sync.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_sync/sync.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_sync_spin_lock/sync_spin_lock.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_sync_spin_lock/sync_spin_lock.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_sync_spin_lock/sync_spin_lock.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_ticks/ticks.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_ticks/ticks.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_ticks/ticks.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_timer/timer.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_timer/timer.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_timer/timer.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_uart/uart.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_uart/uart.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_uart/uart.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_vreg/vreg.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_vreg/vreg.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_vreg/vreg.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_watchdog/watchdog.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_watchdog/watchdog.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_watchdog/watchdog.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_xip_cache/xip_cache.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_xip_cache/xip_cache.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_xip_cache/xip_cache.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/hardware_xosc/xosc.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_xosc/xosc.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/hardware_xosc/xosc.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_atomic/atomic.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_atomic/atomic.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_atomic/atomic.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_bootrom/bootrom.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_bootrom/bootrom.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_bootrom/bootrom.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_bootrom/bootrom_lock.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_bootrom/bootrom_lock.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_bootrom/bootrom_lock.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_clib_interface/newlib_interface.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_clib_interface/newlib_interface.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_clib_interface/newlib_interface.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_divider/divider_compiler.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_divider/divider_compiler.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_divider/divider_compiler.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_double/double_math.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_double/double_math.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_double/double_math.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/rp2040_usb_device_enumeration.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/rp2040_usb_device_enumeration.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/rp2040_usb_device_enumeration.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_flash/flash.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_flash/flash.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_flash/flash.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_float/float_math.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_float/float_math.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_float/float_math.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_malloc/malloc.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_malloc/malloc.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_malloc/malloc.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_platform_panic/panic.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_platform_panic/panic.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_platform_panic/panic.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_printf/printf.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_printf/printf.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_printf/printf.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_runtime/runtime.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime/runtime.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime/runtime.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init_clocks.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init_clocks.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init_clocks.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init_stack_guard.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init_stack_guard.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_runtime_init/runtime_init_stack_guard.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_standard_binary_info/standard_binary_info.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_standard_binary_info/standard_binary_info.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_standard_binary_info/standard_binary_info.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio/stdio.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio/stdio.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio/stdio.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio_uart/stdio_uart.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_uart/stdio_uart.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_uart/stdio_uart.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/reset_interface.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/reset_interface.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/reset_interface.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/stdio_usb.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/stdio_usb.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/stdio_usb.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/stdio_usb_descriptors.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/stdio_usb_descriptors.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdio_usb/stdio_usb_descriptors.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_stdlib/stdlib.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdlib/stdlib.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_stdlib/stdlib.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_unique_id/unique_id.c" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_unique_id/unique_id.c.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_unique_id/unique_id.c.o.d"
  "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 3/src/main.c" "src/CMakeFiles/app.dir/main.c.o" "gcc" "src/CMakeFiles/app.dir/main.c.o.d"
  "/home/juan/pico-sdk/src/rp2_common/pico_cxx_options/new_delete.cpp" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_cxx_options/new_delete.cpp.o" "gcc" "src/CMakeFiles/app.dir/home/juan/pico-sdk/src/rp2_common/pico_cxx_options/new_delete.cpp.o.d"
  )

# Targets to which this target links which contain Fortran sources.
set(CMAKE_Fortran_TARGET_LINKED_INFO_FILES
  )

# Targets to which this target links which contain Fortran sources.
set(CMAKE_Fortran_TARGET_FORWARD_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
