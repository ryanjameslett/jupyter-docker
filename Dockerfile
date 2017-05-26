FROM alpine:3.5

# Get alpine ready and up to date
RUN apk update \
    && apk add ca-certificates wget \
    && apk add openssl \
    && apk add bash \
    && update-ca-certificates

##  Python3 + deps
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/unreleased/glibc-2.25-r1.apk \
    && apk add glibc-2.25-r1.apk \
    && apk add --no-cache python3 \
    && python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools \
    && rm -rf /root/.cache

## Install anaconda and do cleanup
RUN wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O anaconda.sh \
    && chmod 700 anaconda.sh \
    && /bin/bash anaconda.sh -bp /root/anaconda \
    && rm -f anaconda.sh \
    && /root/anaconda/bin/conda install -y jupyter

WORKDIR /var/workspace
EXPOSE 8888

CMD ["/root/anaconda/bin/jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--log-level=DEBUG"]
