add_executable(app src/main.cpp)
target_link_libraries(app PRIVATE core spdlog::spdlog fmt::fmt)
target_include_directories(app PRIVATE ${CMAKE_SOURCE_DIR}/core/include)
