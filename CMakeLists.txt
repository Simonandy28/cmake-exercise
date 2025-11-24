cmake_minimum_required(VERSION 3.16)
project(cmake-exercise)

# Find Boost package
find_package(Boost REQUIRED COMPONENTS filesystem)

# Source files
add_executable(main 
    main.cpp
    flatset/flatset.cpp 
    filesystem/filesystem.cpp
)

# Include directories so that main can find header files
target_include_directories(main PUBLIC ${CMAKE_SOURCE_DIR})

# Needed to link boost filesystem
target_link_libraries(main PRIVATE Boost::filesystem)