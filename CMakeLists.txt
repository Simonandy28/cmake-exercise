cmake_minimum_required(VERSION 3.16)
project(cmake-exercise)

set(CMAKE_CXX_STANDARD 17)

# Find Boost package for flatset and filesystem
find_package(Boost REQUIRED COMPONENTS filesystem)

# Find deal for fem
find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()

# Source files
add_executable(main 
    main.cpp
    flatset/flatset.cpp 
    filesystem/filesystem.cpp
    fem/fem.cpp
)

# Include directories so that main can find header files
target_include_directories(main PUBLIC ${CMAKE_SOURCE_DIR})

# Needed to link boost filesystem
target_link_libraries(main Boost::filesystem)

# macro: https://dealii.org/current/users/cmake_user.html#cmakeauto
deal_ii_setup_target(main)