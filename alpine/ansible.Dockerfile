# pull base image
FROM alpine

LABEL maintainer="Harry Ho"


RUN echo "===> Installing Ansible..."  && \
    apk add ansible                  && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python3 && \
    apk --update add py3-pip openssl ca-certificates git   && \
    \
    \
    echo "===> Install aws boto" && \
    pip3 install boto3 botocore && \
    \
    \
    echo "===> Removing package list..."  && \
    rm -rf /var/cache/apk/*               
