cmake_minimum_required(VERSION 3.16)

include(cmake/avr-toolchain.cmake)
project(AvrProject LANGUAGES C CXX)


include_directories(
  ${CMAKE_SOURCE_DIR}/include/
)

file(GLOB_RECURSE SRC_FILES
  "src/*.cpp"
)

add_executable(${PROJECT_NAME}.elf ${SRC_FILES})

add_custom_command(
    OUTPUT ${PROJECT_NAME}.hex
    COMMAND ${CMAKE_OBJCOPY} -O ihex -R .eeprom $<TARGET_FILE:${PROJECT_NAME}.elf> ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.hex
    DEPENDS ${PROJECT_NAME}.elf
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Generating HEX file: ${PROJECT_NAME}.hex"
)

add_custom_target(${PROJECT_NAME}_outputs ALL
    DEPENDS ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.hex
    COMMENT "Building HEX file"
)


set(PROJECT_HEX_FILE ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.hex)

include(cmake/flash.cmake)

