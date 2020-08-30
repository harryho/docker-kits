#!/bin/bash

DOCKER_REPO='harryh00/docker-kits'

#########################################################################################
## --------------------- Build images  ---------------------------
#########################################################################################

build_image() {
    FOLDER=$1
    echo "----- Build ${FOLDER} based image -----"
    for fname in $(ls ${FOLDER}); do
        PREFIX=${fname/".Dockerfile"/""}
        echo ":::: Build ${DOCKER_REPO}:${FOLDER}-${PREFIX}"
        docker build ${FOLDER} -f "${FOLDER}/${PREFIX}.Dockerfile" -t "${DOCKER_REPO}:${FOLDER}-${PREFIX}"
    done
}

#########################################################################################
## --------------------- Push images to docker hub ---------------------------
#########################################################################################

## alpine basealpined image
push_image() {
    FOLDER=$1
    echo "----- Push ${FOLDER} based image -----"
    for fname in $(ls ${FOLDER}); do
        PREFIX=${fname/".Dockerfile"/""}
        echo ":::: Push ${DOCKER_REPO}:${FOLDER}-${PREFIX}"
        docker push ${DOCKER_REPO}:${FOLDER}-${PREFIX}
    done
}

# Main
main() {
    docker login
    docker info
    FOLDERS=(
        # alpine
        # ubuntu
        centos
    )
    for FOLDER in ${FOLDERS[@]}; do
        # echo $FOLDER
        build_image ${FOLDER}
        push_image ${FOLDER}
    done
}

main "$@"
