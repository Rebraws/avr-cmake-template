
find_program(AVR_CC avr-gcc-14 REQUIRED)
find_program(AVR_CXX avr-g++-14 REQUIRED)
find_program(AVR_OBJCOPY avr-gcc-14 REQUIRED)
find_program(AVR_SIZE avr-size REQUIRED)
find_program(AVR_OBJDUMP avr-objdump REQUIRED)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)
set(CMAKE_CXX_COMPILER ${AVR_CXX})
set(CMAKE_C_COMPILER ${AVR_CC})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Microcontroller and clock frequeny
set(AVR_MCU "atmega328p")
message(STATUS "AVR Toolchain: Target MCU set to ${AVR_MCU}")
set(F_CPU "16000000UL")
message(STATUS "AVR Toolchain: Target F_CPU set to ${F_CPU}")

# Flags
set(CMAKE_CXX_FLAGS "-mmcu=${AVR_MCU} -DF_CPU=${F_CPU} -Os -Wall -Wextra -flto -fno-exceptions")

set(CMAKE_EXE_LINKER_FLAGS "-mmcu=${AVR_MCU} -Wl,--gc-sections -flto")

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

