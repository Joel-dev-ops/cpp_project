cmake_minimum_required(VERSION 3.20)
project(cpp_project LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(external)
add_subdirectory(core)
add_subdirectory(app)
add_subdirectory(tests)
