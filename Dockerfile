FROM alpine:3.5

RUN apk update \
    && apk add ca-certificates wget \
    && apk add openssl \
    && apk add bash \
    && update-ca-certificates

## Install python3 deps
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub 
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/unreleased/glibc-2.25-r1.apk 
RUN apk add glibc-2.25-r1.apk 

## Install python3
RUN apk add --no-cache python3 \
    && python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools \
    && rm -rf /root/.cache

RUN wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O anaconda.sh
RUN chmod 700 anaconda.sh \
    && /bin/bash anaconda.sh -bp /root/anaconda
RUN rm -f anaconda.sh 
RUN /root/anaconda/bin/conda install -y jupyter

ADD notebooks /var/workspace
WORKDIR /var/workspace
EXPOSE 8888

#  CMD ["/bin/sh", "-c", "/root/anaconda/bin/jupyter", "notebook --no-browser --ip=0.0.0.0 --notebook-dir=/var/workspace"]
CMD ["/root/anaconda/bin/jupyter", "notebook", "--no-browser", "--ip=0.0.0.0"]

