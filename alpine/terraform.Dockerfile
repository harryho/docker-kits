# pull base image
FROM alpine:3.8

LABEL MAINTAINER Harry Ho


ENV TERRAFORM_VERSION=0.12.26
ENV TERRAFORM_SHA256SUM=607bc802b1c6c2a5e62cc48640f38aaa64bef1501b46f0ae4829feb51594b257


RUN echo "===> Download terraform..."  && \
    apk  --update --no-cache add bash git openssh curl && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    
    
RUN echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip  

RUN echo "===> Removing package list..."  && \
    rm -rf /var/cache/apk/*  


# WORKDIR /work

# CMD ["/bin/bash"]

# ENTRYPOINT ["/bin/terraform"]