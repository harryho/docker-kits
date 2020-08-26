#!/bin/bash

printf "\n ::: apline aws cli 2 kit ::: \n"
docker run --rm -it harryh00/docker-kits:alpine-aws2  aws --version 

printf "\n ::: apline ansible kit ::: \n"
docker run --rm -it harryh00/docker-kits:alpine-ansible ansible --version 

printf "\n ::: apline terraform  kit ::: \n"
docker run --rm -it harryh00/docker-kits:alpine-terraform terraform --version 

printf "\n ::: apline k8s  kit ::: \n"
docker run --rm -it harryh00/docker-kits:alpine-k8s \
    aws --version && \
    kubectl version --client 


## ubuntu
printf "\n ::: ubuntu ansible kit ::: \n"
docker run --rm -it harryh00/docker-kits:ubuntu-ansible ansible --version 
