FROM centos:centos7

LABEL maintainer="Harry Ho"

ENV container=docker

ENV pip_packages "ansible"

# Install systemd -- See https://hub.docker.com/_/centos/
RUN echo "===> Installing systemd..."  && \
    yum -y update; yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install requirements.
RUN echo "===> Installing required pakages..."  && \
    yum makecache fast && \
    yum -y install deltarpm epel-release initscripts && \
    yum -y update && \
    yum -y install sudo which  python-pip && \
    yum clean all

# Install Ansible via Pip.
RUN echo "===> Adding ansible runtime..."  && \ 
    pip install ansible

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# # Install Ansible inventory file.
# RUN mkdir -p /etc/ansible
# RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
# CMD ["/usr/lib/systemd/systemd"] 

