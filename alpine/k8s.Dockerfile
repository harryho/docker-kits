FROM alpine

LABEL maintainer="Harry Ho"

ARG KUBECTL_VERSION=1.17.5

# Install kubectl (same version of aws esk)
RUN echo "===> Installkubectl " &&  \
    apk add --update --no-cache curl git && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl


# Remove packages
RUN echo "===> Removing package list..." \
    apk cache clean && \
    apk --quiet del  curl && \
    rm -rf /var/cache/apk/*   

    