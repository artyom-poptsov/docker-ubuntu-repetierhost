FROM ubuntu:latest

MAINTAINER Artyom V. Poptsov <poptsov.artyom@gmail.com>

### Install basic packages.
RUN apt-get update -qq && apt-get -qqy install \
    wget \
    xz-utils \
    libmono-system-windows-forms4.0-cil \
    libgtk2.0-0 \
    libmono-system-serviceprocess4.0-cil \
    libglew1.1

### Install RepetierHost
WORKDIR /opt/
RUN wget http://download.repetier.com/files/host/linux/repetierHostLinux_2_1_2.tgz

RUN tar --gzip --extract -f repetierHostLinux_2_1_2.tgz

WORKDIR /opt/RepetierHost/
