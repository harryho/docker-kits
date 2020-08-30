# pull base image
FROM alpine

LABEL maintainer="Harry Ho"


RUN echo "===> Installing Ansible..."  && \
    apk add ansible                  && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python3 && \
    apk --update add py3-pip openssl ca-certificates    && \
    \
    \
    echo "===> Install aws boto mobule" && \
    pip3 install --upgrade pip3 && \
    pip3 install boto3 botocore && \
    \
    \
    echo "===> Removing package list..."  && \
    rm -rf /var/cache/apk/*               
