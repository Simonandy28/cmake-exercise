# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

# Build and Running
docker build -t cmake-exercise .
docker run -it --rm -v <directory>:/cmake-exercise cmake-exercise
//Statt dem directory auch ${PWD}

mkdir build
cmake ..
make
./main
