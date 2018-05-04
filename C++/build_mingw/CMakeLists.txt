cmake_minimum_required(VERSION 3.4 FATAL_ERROR)
set(PROJECT RoboDK-API)
project(${PROJECT} LANGUAGES CXX)

link_directories("../../../qt/mingw53_32/lib")

add_library(${PROJECT} SHARED "../robodk_api.cpp")

target_compile_definitions(${PROJECT}
  PUBLIC RDK_WITH_EXPORTS
  PRIVATE RDK_EXPORTS
)
target_compile_options(${PROJECT} PUBLIC -m32)

target_include_directories(${PROJECT} PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../../../qt/mingw53_32/include>  
    $<INSTALL_INTERFACE:../../../qt/mingw53_32/include>)

target_link_libraries(${PROJECT} 
  libQt5Core.a
  libQt5Gui.a
  libQt5Network.a)

set_target_properties(${PROJECT} PROPERTIES
  LINK_FLAGS -m32
  PREFIX ""
  DEBUG_POSTFIX "_debug")

set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../install)
install(TARGETS ${PROJECT} EXPORT ${PROJECT} DESTINATION bin)
install(EXPORT ${PROJECT} DESTINATION config)