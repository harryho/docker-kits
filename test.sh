#!/bin/bash

printf "\n ::: aws cli 2 kit ::: \n"
docker run --rm -it harryh00/docker-kits:alpine3.8-aws2  aws --version 

printf "\n ::: ansible kit ::: \n"
docker run --rm -it harryh00/docker-kits:alpine3.8-ansible ansible --version 

printf "\n ::: terraform  kit ::: \n"
docker run --rm -it harryh00/docker-kits:alpine3.8-terraform terraform --version 

