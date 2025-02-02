cmake_minimum_required(VERSION 3.15...3.31)

project(BOS VERSION 0.0.1 LANGUAGES C)
set(BOS_CMAKE_BUILD_TESTING ON)

include(CTest)

add_custom_target(
	doc
	COMMAND cd .. && jupyter-book build .
	#	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/doc
	COMMENT "Generating API documentation with Doxygen"
	VERBATIM
)

add_subdirectory(src)

if(BUILD_TESTING)
	add_subdirectory(tests)
endif()

option(WITH_LWIP "Build with lwip" ON)
if(WITH_LWIP)
  include(ExternalProject)
  ExternalProject_Add(external-lwip
    URL https://download.savannah.nongnu.org/releases/lwip/lwip-2.2.0.zip
    UPDATE_COMMAND ""
    CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX:PATH=${PROJECT_BINARY_DIR}/third_party/lwip
      -DCMAKE_TOOLCHAIN_FILE:PATH=${TOOLCHAIN_FILE}
      -DCMAKE_BUILD_TYPE:STRING=Debug
      -DENABLE_TESTING:BOOL=OFF
      -DENABLE_PROGRAMS:BOOL=OFF
    TEST_COMMAND ""
    )
    set(LWIP_PREFIX ${PROJECT_BINARY_DIR}/third_party/mbedtls PARENT_SCOPE)
endif(WITH_LWIP)

option(WITH_MBEDTLS "Build with mbedtls" ON)
if(WITH_MBEDTLS)
  include(ExternalProject)
  ExternalProject_Add(external-mbedtls
    URL https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-3.6.2/mbedtls-3.6.2.tar.bz2
    UPDATE_COMMAND ""
    PATCH_COMMAND ./scripts/config.py set MBEDTLS_THREADING_C &&
                  ./scripts/config.py set MBEDTLS_THREADING_PTHREAD
    CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX:PATH=${PROJECT_BINARY_DIR}/third_party/mbedtls
      -DCMAKE_TOOLCHAIN_FILE:PATH=${TOOLCHAIN_FILE}
      -DCMAKE_BUILD_TYPE:STRING=Debug
      -DENABLE_TESTING:BOOL=OFF
      -DENABLE_PROGRAMS:BOOL=ON
    TEST_COMMAND ""
    )
    set(MBEDTLS_PREFIX ${PROJECT_BINARY_DIR}/third_party/mbedtls PARENT_SCOPE)
endif(WITH_MBEDTLS)
