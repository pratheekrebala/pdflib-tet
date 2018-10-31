FROM ubuntu:latest

LABEL maintainer prebala@publicintegrity.org
LABEL description "Image to run PDFLib TET in a linux container"

ARG tetBinary="https://www.pdflib.com/binaries/TET/510/TET-5.1-Linux-x86_64-Perl-PHP-Python-Ruby.tar.gz"

RUN apt -y update
RUN apt -y install curl

WORKDIR /pdflib-tet

RUN curl $tetBinary | tar xvz --strip-components=1 -C .
RUN ls . && rm licensekeys.txt

VOLUME [ "/data" ]
VOLUME [ "/pdflib-tet/licensekeys.txt" ]