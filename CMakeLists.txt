cmake_minimum_required(VERSION 3.20)
project(cpp_project LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectories(external)
add_subdirectories(core)
add_subdirectories(app)
add_subdirectories(tests)
