FROM ubuntu:latest

MAINTAINER Artyom V. Poptsov <poptsov.artyom@gmail.com>

ENV REPETIER_HOST_VERSION="2_1_6"

RUN echo "America/New_York" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

### Install basic packages.
RUN apt-get update -qq && apt-get -qqy install \
    wget \
    xz-utils \
    libmono-system-windows-forms4.0-cil \
    libgtk2.0-0 \
    libmono-system-serviceprocess4.0-cil \
    libglew2.0 \
    libcanberra-gtk-module

### Install dependencies for Slic3r.
RUN apt -qqy install \
    libsm6 \
    freeglut3 \
    libglu1-mesa \
    libxmu6

### Install RepetierHost
WORKDIR /opt/
RUN wget --quiet \
    http://download.repetier.com/files/host/linux/repetierHostLinux_${REPETIER_HOST_VERSION}.tgz

RUN tar --gzip --extract -f repetierHostLinux_${REPETIER_HOST_VERSION}.tgz

### Install Slic3r

RUN wget --quiet \
    https://dl.slic3r.org/linux/slic3r-1.3.0-linux-x64.tar.bz2

RUN tar --bzip --extract -f slic3r-1.3.0-linux-x64.tar.bz2

RUN wget --quiet \
    https://github.com/prusa3d/PrusaSlicer/releases/download/version_2.0.0/PrusaSlicer-2.0.0+linux64-201905201652.tar.bz2

RUN tar --bzip --extract -f PrusaSlicer-2.0.0+linux64-201905201652.tar.bz2

WORKDIR /opt/RepetierHost/
