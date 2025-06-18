#FROM ubuntu:18.04

FROM continuumio/miniconda3:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        libz-dev \
        libbz2-dev \
        liblzma-dev \
        libncurses5-dev \
        libncursesw5-dev \
        zlib1g-dev \
        ca-certificates \
        wget \
        curl \
        git \
        bzip2 \
        make \
        gcc \
        g++ \
        python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Conda environment creation as before
RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    conda create -y -n kleborate-env python=3.9

SHELL ["conda", "run", "-n", "kleborate-env", "/bin/bash", "-c"]

RUN conda install -y \
        minimap2 \
        mash \
        ncbi-amrfinderplus \
        ezclermont && \
    pip install kleborate ectyper && \
    conda clean -afy

# Install stxtyper from source
RUN git clone https://github.com/evolarjun/stxtyper.git /opt/stxtyper && \
    cd /opt/stxtyper && \
    make && \
    make test && \
    cp stxtyper /opt/conda/envs/kleborate-env/bin/

ENV PATH="/opt/conda/envs/kleborate-env/bin:$PATH"
ENV CONDA_DEFAULT_ENV=kleborate-env

RUN kleborate --version

WORKDIR /data

ENTRYPOINT ["kleborate"]

