# Dockerfile for FermiLib+ProjectQ

# Change the following line to "FROM continuumio/anaconda" to use Python 2
FROM continuumio/anaconda

USER root

RUN apt-get update
RUN apt-get install -y g++ build-essential libatlas-base-dev=3.10.2-7

RUN wget http://www.cmake.org/files/v3.5/cmake-3.5.2.tar.gz
RUN tar xf cmake-3.5.2.tar.gz && \
    cd cmake-3.5.2            && \
    ./configure               && \
    make && make install

# Install ProjectQ, FermiLib, FermiLib plugin psi4
RUN pip install git+https://github.com/ProjectQ-Framework/ProjectQ.git@v0.3.2 \
                git+https://github.com/ProjectQ-Framework/FermiLib.git@v0.1a3 \
                fermilibpluginpsi4==0.1a1

# Install ATLAS (BLAS required by psi4)

# Install psi4
RUN git clone https://github.com/psi4/psi4.git
RUN cd psi4 && cmake -H. -Bbuild && \
    cd build && make -j`getconf _NPROCESSORS_ONLN` && make install

