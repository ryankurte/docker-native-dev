FROM ubuntu:latest
MAINTAINER Ryan Kurte <ryankurte@gmail.com>
LABEL Description="Docker image for building x86/64 native projects"

# General dependencies
RUN apt-get update && apt-get install -y \
  git \
  subversion \
  cmake \
  make \
  automake \
  python-setuptools \
  ninja-build \
  python-dev \
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
  python3-pip

# Update PIP & Install useful packages
RUN pip3 install --upgrade pip
RUN pip3 install pystache pyyaml

# Install GoogleTest
RUN git clone https://github.com/google/googletest.git
RUN mkdir -p googletest/build && cd googletest/build && cmake .. && make && cd ../..

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt

