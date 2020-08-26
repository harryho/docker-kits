#!/bin/bash

DOCKER_REPO='harryh00/docker-kits'

docker login 

docker info


# Build images

## Alpine based image 

echo "----- Alpine based image -----"

echo ":::: Build ${DOCKER_REPO}:alpine-ansible"

docker build alpine -f alpine/ansible.Dockerfile -t ${DOCKER_REPO}:alpine-ansible

echo ":::: Build ${DOCKER_REPO}:alpine-terraform"

docker build alpine -f alpine/terraform.Dockerfile -t ${DOCKER_REPO}:alpine-terraform

echo ":::: Build ${DOCKER_REPO}:alpine-aws2"

docker build alpine -f alpine/aws2.Dockerfile -t ${DOCKER_REPO}:alpine-aws2

echo ":::: Build ${DOCKER_REPO}:alpine-k8s"

docker build alpine -f alpine/k8s.Dockerfile -t ${DOCKER_REPO}:alpine-k8s

## Ubuntu based image 

echo "----- Uubntu based image -----"

echo ":::: Build ${DOCKER_REPO}:alpine-ansible"
docker build alpine -f ubuntu/ansible.Dockerfile -t ${DOCKER_REPO}:ubuntu-ansible


# Push images

## alpine based image 
echo "----- alpine based image -----"

echo ":::: Push ${DOCKER_REPO}:alpine-ansible"
docker push ${DOCKER_REPO}:alpine-ansible


echo ":::: Push ${DOCKER_REPO}:alpine-terraform"

docker push ${DOCKER_REPO}:alpine-terraform

echo ":::: Push ${DOCKER_REPO}:alpine-aws2"

docker push ${DOCKER_REPO}:alpine-aws2


echo ":::: Push ${DOCKER_REPO}:alpine-k8s"

docker push ${DOCKER_REPO}:alpine-k8s



## Ubuntu based image 

echo "----- Uubntu based image -----"

echo ":::: Push ${DOCKER_REPO}:ubuntu-ansible"
docker push ${DOCKER_REPO}:ubuntu-ansible