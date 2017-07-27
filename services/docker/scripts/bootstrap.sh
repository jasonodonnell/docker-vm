#!/bin/bash

DOCKER_URL='https://download.docker.com/linux/centos/docker-ce.repo'
COMPOSE_VERSION='1.15.0'
REPO_URL='https://github.com/docker/compose/releases/download'
COMPOSE_URL="${REPO_URL?}/${COMPOSE_VERSION?}/docker-compose-`uname -s`-`uname -m`"
USER='vagrant'

# Add vagrant to docker group for permissions
groupadd docker
usermod -a -G docker ${USER?}

# Install Docker
yum install -y \
    yum-utils \
    device-mapper-persistent-data \
    lvm2

yum-config-manager \
    --add-repo \
    ${DOCKER_URL?}

yum makecache fast
yum install -y docker-ce

# Install compose
curl -L ${COMPOSE_URL?} > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

systemctl start docker

exit 0
