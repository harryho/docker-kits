# Docker Kits

## Summary 
The repository is the collection of tool kits built on the top of docker image. 

Repository name in Docker Hub: [harryh00/docker-kits](https://hub.docker.com/r/harryh00/docker-kits)


## Why chooses docker

Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package. 

## Benefits

Containers work a little like VMs, but in a far more specific and granular way. The benefits of Docker containers show up in many places. Here are some of the advantages of Docker used as tool kits:

* Docker enables more efficient use of system resources
* Docker enables faster software delivery cycles
* Docker enables application portability

## Images and tags

* Stable versions

    * harryh00/docker-kits:alpine-ansible
    * harryh00/docker-kits:alpine-terraform


## How to use

* Sample 1: use ansible kit 
  

```
# one-off use
docker run --rm -it harryh00/docker-kits:alpine-ansible  ansible --version 

# use the kit  without install ansible
docker run --rm -it  -v ${PWD}:/app   -w /app harryh00/docker-kits:alpine-ansible   /bin/bash 

```

* Sample 2: use aws cli kit 

```
# mount the local aws config to aws cli kit 
docker run --rm -it -v ~/.aws:/root/.aws  harryh00/docker-kits:alpine-aws2
```

* Sample 3: use k8s cli kit 

```
docker run --rm -it -v ~/.kube:/root/.kube -v ~/.aws:/root/.aws  harryh00/docker-kits:alpine-k8s
```



