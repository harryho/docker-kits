# pull base image
FROM alpine

LABEL maintainer="Harry Ho"


ENV GLIBC_VER=2.32-r0

# install glibc compatibility for alpine
# You will see some warning during the build process.
# e.g. /usr/glibc-compat/lib/ld-linux-x86-64.so.2 is not a symbolic link
RUN echo "===> Installing binutils , curl" &&  \
    apk --no-cache add binutils  curl git && \
    \
    \
    echo "===> Download & install glibc " &&  \
    curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub &&  \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk &&  \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk &&  \
    apk add --no-cache \
        glibc-${GLIBC_VER}.apk \
        glibc-bin-${GLIBC_VER}.apk &&  \
    echo "===> Download & install aws cli v2 " &&  \
    curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip &&  \
    unzip awscliv2.zip && \
    aws/install &&  \
    rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/*/dist/aws_completer \
        /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/*/dist/awscli/examples 

RUN echo "===> Removing package list..." \
    apk cache clean && \
    apk --quiet del binutils  curl 

RUN rm glibc-${GLIBC_VER}.apk &&  \
    rm glibc-bin-${GLIBC_VER}.apk &&  \
    rm -rf /var/cache/apk/*

