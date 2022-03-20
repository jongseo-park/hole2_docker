FROM ubuntu:16.04


RUN apt-get update && \
    apt-get install -y \
    build-essential \
    wget \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /opt/
RUN wget http://www.holeprogram.org/downloads/2.2.005/hole2-ApacheLicense-2.2.005-Linux-x86_64.tar.gz \ 
    && tar -zxvf hole2-ApacheLicense-2.2.005-Linux-x86_64.tar.gz


WORKDIR /opt/hole2/
RUN echo 'export PATH="/opt/hole2/exe/":$PATH' >> ~/.bashrc \
    && /bin/bash -c "source ~/.bashrc" \ 
    && mkdir /home/hole2


WORKDIR /home/hole2/
# ENV PATH="/opt/hole2/exe/:$PATH"