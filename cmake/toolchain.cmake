# Detect if user already provided system/processor (for cross builds)
if (NOT CMAKE_SYSTEM_NAME)
    set(CMAKE_SYSTEM_NAME Linux)
endif()

if (NOT CMAKE_SYSTEM_PROCESSOR)
    execute_process(
        COMMAND uname -m
        OUTPUT_VARIABLE HOST_ARCH
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    set(CMAKE_SYSTEM_PROCESSOR ${HOST_ARCH})
endif()


# LLVM + clang Toolchain with CCached and LLD

set(CMAKE_C_COMPILER_LAUNCHER ccache)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)

set(CMAKE_C_COMPILER clang CACHE STRING "" FORCE)
set(CMAKE_CXX_COMPILER clang++ CACHE STRING "" FORCE)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_BUILD_TYPE_INIT "Release")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")

find_program(LLD_LINKER NAMES ld.lld)
if (LLD_LINKER)
    message(STATUS "Using LLD linker: ${LLD_LINKER}")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=lld")
endif()

find_program(NINJA_EXE NAMES ninja)
if (NINJA_EXE)
    set(CMAKE_MAKE_PROGRAM ${NINJA_EXE} CACHE FILEPATH "Ninja executable" FORCE)
endif()

set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/install" CACHE PATH "Install directory" FORCE)

message(STATUS "Using LLVM Toolchain with CCache and Ninja")
