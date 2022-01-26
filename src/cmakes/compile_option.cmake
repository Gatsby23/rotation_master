if(MSVC)
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup")
else()
    set(CMAKE_CXX_STANDARD 14)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -O2 -DNDEBUG")
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} -g3 -O0")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -O2 -DNDEBUG")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} -g3 -O0")
    if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
        message(STATUS "No build type selected, default to Release")
        set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type (default Release)" FORCE)
    endif()
endif()

if (EMSCRIPTEN)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DGLFW_INCLUDE_ES3 -DIMGUI_IMPL_OPENGL_ES3 \
        -s USE_WEBGL2=1 \
        -s FULL_ES3=1 \
        -s USE_GLFW=3 \
        --shell-file ${CMAKE_CURRENT_LIST_DIR}/../../html_template/shell_minimal.html"
    )
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -O2 -DNDEBUG")
    set(CMAKE_EXECUTABLE_SUFFIX ".html")
endif()