# pull base image
FROM alpine:3.8

LABEL MAINTAINER Harry Ho


RUN echo "===> Installing sudo to emulate normal OS behavior..."  && \
    apk --update add sudo                                         && \
    \
    \
    echo "===> add bash " && \ 
    apk add --no-cache bash && \
    \
    echo "===> Installing Ansible..."  && \
    apk add ansible                  && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python3 && \
    apk --update add py3-pip openssl ca-certificates    && \
    \
    \
    echo "===> Install aws boto mobule" && \
    pip3 install boto3 botocore && \
    \
    \
    echo "===> Removing package list..."  && \
    rm -rf /var/cache/apk/*               