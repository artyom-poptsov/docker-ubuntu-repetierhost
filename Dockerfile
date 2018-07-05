FROM ubuntu:latest

MAINTAINER Artyom V. Poptsov <poptsov.artyom@gmail.com>

RUN echo "America/New_York" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

### Install basic packages.
RUN apt-get update -qq && apt-get -qqy install \
    wget \
    xz-utils \
    libmono-system-windows-forms4.0-cil \
    libgtk2.0-0 \
    libmono-system-serviceprocess4.0-cil \
    libglew2.0

### Install dependencies for Slic3r.
RUN apt -qqy install \
    libsm6 \
    freeglut3 \
    libglu1-mesa \
    libxmu6

### Install RepetierHost
WORKDIR /opt/
RUN wget --quiet \
    http://download.repetier.com/files/host/linux/repetierHostLinux_2_1_2.tgz

RUN tar --gzip --extract -f repetierHostLinux_2_1_2.tgz

### Install Slic3r

RUN wget --quiet \
    https://dl.slic3r.org/linux/slic3r-linux-x86_64-1-2-9-stable.tar.gz

RUN tar --gzip --extract -f slic3r-linux-x86_64-1-2-9-stable.tar.gz

RUN wget --quiet \
    https://github.com/prusa3d/Slic3r/releases/download/version_1.40.1-rc2/Slic3rPE-1.40.1-rc2.linux64-full-201807031509.tar.bz2

RUN tar --bzip --extract -f Slic3rPE-1.40.1-rc2.linux64-full-201807031509.tar.bz2

WORKDIR /opt/RepetierHost/
