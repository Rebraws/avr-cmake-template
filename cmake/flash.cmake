# script to generate binary and hex format for flashing

find_program(AVRDUDE avrdude REQUIRED)


set(AVRDUDE_PROGRAMMER arduino)
set(AVRDUDE_PORT /dev/ttyUSB0)
set(AVRDUDE_BAUDRATE "115200")

set(AVRDUDE_MCU m328p CACHE STRING "")

add_custom_target(flash
  COMMAND ${AVRDUDE} 
  -c ${AVRDUDE_PROGRAMMER}
  -p ${AVRDUDE_MCU}
  -P ${AVRDUDE_PORT}
  -b ${AVRDUDE_BAUDRATE}
  -D
  -U flash:w:${PROJECT_HEX_FILE}:i
  DEPENDS ${PROJECT_HEX_FILE}
  COMMENT "Flashing ${PROJECT_HEX_FILE} to ${AVRDUDE_MCU} on ${AVRDUDE_PORT}"
  VERBATIM
)


message(STATUS "AVR Flash target added (Programmer: ${AVRDUDE_PROGRAMMER}, Port: ${AVRDUDE_PORT}, MCU: ${MCU})")
