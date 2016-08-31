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
  build-essential

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt

