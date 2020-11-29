# pull base image
FROM alpine

LABEL maintainer="Harry Ho"


ENV TERRAFORM_VERSION=0.13.5
ENV TERRAFORM_SHA256SUM=f7b7a7b1bfbf5d78151cfe3d1d463140b5fd6a354e71a7de2b5644e652ca5147

# 607bc802b1c6c2a5e62cc48640f38aaa64bef1501b46f0ae4829feb51594b257

RUN echo "===> Installing common packages ..." && \
    apk --update --no-cache add ca-certificates openssh curl git 


RUN echo "===> Download terraform..."  && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    \
    \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip  


RUN echo "===> Installing Ansible..."  && \
    apk add ansible                  && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python3 && \
    apk --update add py3-pip  && \
    \
    \
    echo "===> Install aws boto mobule" && \
    pip3 install boto3       

RUN echo "===> Installing kubectl ..."  && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl


# Remove packages
RUN echo "===> Removing package list..." \
    apk cache clean && \
    apk --quiet del curl && \
    rm -rf /var/cache/apk/*   

