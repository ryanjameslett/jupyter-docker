FROM ubuntu:16.04

## install python
RUN apt-get update \
    && apt-get install -y apt-utils python3 python3-pip wget \
    && pip3 install --upgrade pip setuptools

## Install anaconda and do cleanup
RUN wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O anaconda.sh \
    && chmod 700 anaconda.sh \
    && /bin/bash anaconda.sh -bp /root/anaconda \
    && rm -f anaconda.sh \
    && /root/anaconda/bin/conda install -y jupyter

WORKDIR /var/workspace
EXPOSE 8888

CMD ["/root/anaconda/bin/jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--log-level=DEBUG"]
