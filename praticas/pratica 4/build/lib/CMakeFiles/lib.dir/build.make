# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build"

# Include any dependencies generated for this target.
include lib/CMakeFiles/lib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include lib/CMakeFiles/lib.dir/compiler_depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/lib.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/lib.dir/flags.make

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/event_groups.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/event_groups.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/event_groups.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/event_groups.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.s

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/list.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/list.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/list.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/list.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.s

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/queue.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/queue.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/queue.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/queue.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.s

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/stream_buffer.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/stream_buffer.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/stream_buffer.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/stream_buffer.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.s

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/tasks.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/tasks.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/tasks.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/tasks.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.s

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/timers.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/timers.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/timers.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/timers.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.s

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/portable/MemMang/heap_3.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/portable/MemMang/heap_3.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/portable/MemMang/heap_3.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/portable/MemMang/heap_3.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.s

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o: lib/CMakeFiles/lib.dir/flags.make
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o: /media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica\ 4/lib/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c
lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o: lib/CMakeFiles/lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building C object lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o -MF CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o.d -o CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o -c "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c"

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.i"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c" > CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.i

lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.s"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c" -o CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.s

# Object files for target lib
lib_OBJECTS = \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o" \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o" \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o" \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o" \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o" \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o" \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o" \
"CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o"

# External object files for target lib
lib_EXTERNAL_OBJECTS =

lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/event_groups.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/list.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/queue.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/stream_buffer.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/tasks.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/timers.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.o
lib/liblib.a: lib/CMakeFiles/lib.dir/build.make
lib/liblib.a: lib/CMakeFiles/lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Linking C static library liblib.a"
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && $(CMAKE_COMMAND) -P CMakeFiles/lib.dir/cmake_clean_target.cmake
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/lib.dir/build: lib/liblib.a
.PHONY : lib/CMakeFiles/lib.dir/build

lib/CMakeFiles/lib.dir/clean:
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" && $(CMAKE_COMMAND) -P CMakeFiles/lib.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/lib.dir/clean

lib/CMakeFiles/lib.dir/depend:
	cd "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/lib" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib" "/media/juan/42849DD9849DCFB1/ufc/2025.1/rtos/praticas/pratica 4/build/lib/CMakeFiles/lib.dir/DependInfo.cmake" "--color=$(COLOR)"
.PHONY : lib/CMakeFiles/lib.dir/depend

