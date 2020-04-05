cmake_minimum_required(VERSION 3.6 FATAL_ERROR)
project(http_request_library VERSION 1.0.0 LANGUAGES C)
add_library(http_request_library SHARED http.c http.def)
#add_definitions( -DCURL_STATICLIB )
find_package(CURL REQUIRED) 

set(CURL_LIBRARY "-lcurl") 

SET(CMAKE_C_FLAGS "${CURL_LIBRARY}")

include_directories(${CURL_INCLUDE_DIRS}/curl)
link_directories(${CURL_INCLUDE_DIRS}/curl)
add_executable (http_test http.c)
target_link_libraries(http_test ${CURL_LIBRARIES})


set_target_properties(http_request_library PROPERTIES
    PUBLIC_HEADER http.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "http"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)


