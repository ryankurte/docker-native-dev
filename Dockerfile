FROM ubuntu:latest
MAINTAINER Ryan Kurte <ryankurte@gmail.com>
LABEL Description="Docker image for building x86/64 native projects"

# General dependencies and cleanup
RUN sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
RUN apt-get update && apt-get install -y \
  git \
  subversion \
  curl \
  cmake \
  make \
  automake \
  autoconf \
  python-setuptools \
  ninja-build \
  python-dev \
  libtool \
  unzip \
  libffi-dev \
  libssl-dev \
  libusb-1.0.0 \
  libusb-1.0.0-dev \
  software-properties-common \
  python-software-properties \
  gawk \
  genromfs \
  ccache \
  clang \
  build-essential \
  python3 \
  python3-dev \
  python3-pip \
  libsodium-dev \
  libzmq3-dev \
  golang \
  && apt-get clean && rm -rf /var/lib/apt /tmp/* /var/tmp/*
  

# Update PIP & Install useful packages
RUN pip3 install --upgrade pip && pip3 install pystache pyyaml

# Set working directory for manually installed components
WORKDIR /root

# Install GoogleTest
RUN git clone --branch release-1.8.0 --depth=1 https://github.com/google/googletest.git \
    && cd googletest && mkdir -p build && cd build \
    && cmake -GNinja .. && ninja install \
    && cd ../.. && rm -rf ./googletest

# Install Protobufs
RUN git clone --branch=v3.1.0 --depth=1 https://github.com/google/protobuf.git \
    && cd protobuf \ 
    && ./autogen.sh && ./configure && make -j 4 && make check && make install && ldconfig \
    && cd ./python \
    && python setup.py install \
    && cd ../../ \
    && rm -rf ./protobuf



