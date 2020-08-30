# pull base mage
FROM ubuntu:18.04

LABEL maintainer="Harry Ho"


RUN echo "===> apt-get update ..."  && \
    apt update && \
    echo "===> Install software-properties-common "  && \ 
    apt-get install -y software-properties-common 

RUN echo "Add Ansible ppa..."  && \
    apt-add-repository -y  ppa:ansible/ansible && \
    apt-get update -y 
    
RUN echo "===> Install Ansible " && \
    apt-get install -y ansible && \
    \
    \
    echo "===> Removing package list..."  && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    # rm -rf /var/lib/apt/{lists}/* 
    # The command below will makes it impossible to use apt
    # Other option is to choose the command above
    rm -rf /var/lib/{apt,dpkg,cache,log}/

