#!/bin/bash

DOCKER_REPO='harryh00/docker-kits'



docker login 

docker info


# Build images

echo ":::: Build ${DOCKER_REPO}:alpine3.8-ansible"

docker build alpine -f alpine/ansible.Dockerfile -t ${DOCKER_REPO}:alpine3.8-ansible

echo ":::: Build ${DOCKER_REPO}:alpine3.8-terraform"

docker build alpine -f alpine/terraform.Dockerfile -t ${DOCKER_REPO}:alpine3.8-terraform

echo ":::: Build ${DOCKER_REPO}:alpine3.8-aws2"

docker build alpine -f alpine/aws2.Dockerfile -t ${DOCKER_REPO}:alpine3.8-aws2

# Push images

echo ":::: Push ${DOCKER_REPO}:alpine3.8-ansible"

docker push ${DOCKER_REPO}:alpine3.8-ansible


echo ":::: Push ${DOCKER_REPO}:alpine3.8-terraform"

docker push ${DOCKER_REPO}:alpine3.8-terraform

echo ":::: Push ${DOCKER_REPO}:alpine3.8-aws2"

docker push ${DOCKER_REPO}:alpine3.8-aws2
