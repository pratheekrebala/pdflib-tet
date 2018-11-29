FROM ubuntu:latest

LABEL maintainer prebala@publicintegrity.org
LABEL description "Image to run PDFLib TET in a linux container"

ARG tetBinary="https://www.pdflib.com/binaries/TET/510/TET-5.1-Linux-x86_64-Perl-PHP-Python-Ruby.tar.gz"
ARG jbig2dec="https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs924/jbig2dec-0.15.tar.gz"
ARG imageflow="https://github.com/imazen/imageflow/releases/download/v1.1.0-rc18/imageflow-v1.1.0-rc18-d322657-ubuntu_18_04-x86_64.tar.gz"

RUN apt -y update
RUN apt -y install curl
RUN apt -y install xsltproc build-essential

WORKDIR /pdflib-tet

RUN curl -L $tetBinary | tar xvz --strip-components=1 -C .
RUN ls . && rm licensekeys.txt
RUN ln -s $(pwd)/bin/tet /usr/local/bin/tet

WORKDIR /jbig2dec
RUN apt install -y autoconf libtool imagemagick
RUN curl -L $jbig2dec | tar xvz --strip-components=1 -C .
RUN ./autogen.sh && make && ln -s $(pwd)/jbig2dec /usr/local/bin/jbig2dec

WORKDIR /imageflow
RUN apt install ghostscript
WORKDIR /pdflib-tet

VOLUME [ "/data" ]
VOLUME [ "/pdflib-tet/licensekeys.txt" ]