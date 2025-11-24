FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y \
    build-essential \ 
    cmake \
    libboost-all-dev \
    libdeal.ii-dev \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download yaml 0.6.3
WORKDIR /tmp
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip
RUN unzip yaml-cpp-0.6.3.zip

# Building yaml
WORKDIR /tmp/yaml-cpp-yaml-cpp-0.6.3/build
RUN cmake .. -DYNAML_BUILD_SHARED_LIBS=ON && \
    make && \
    make install

# Cleanup
WORKDIR /
RUN rm -rf /tmp/yaml-cpp*

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /cmake-exercise