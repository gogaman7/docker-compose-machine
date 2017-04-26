FROM ubuntu:16.10

MAINTAINER Igor Belayev <gogaspam1@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DOCKER_MACHINE 0.8.2
ENV DOCKER_COMPOSE 1.9.0
ENV DOCKER_VERSION=17.05.0-ce-rc1

# Install system packages
RUN apt-get update -q \
    && apt-get -y -q install --no-install-recommends \
            curl \
            ca-certificates \
    && curl -L https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE}/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine \
    && chmod +x /usr/local/bin/docker-machine \
    && curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Installing docker client only, removing dockerd, since we don't need it and there is no docker client build yet
RUN mkdir -p /tmp/download && \
     curl -L https://test.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz | tar -xz -C /tmp/download && \
     rm -rf /tmp/download/docker/dockerd && \
     mv /tmp/download/docker/docker* /usr/local/bin/ && \
     rm -rf /tmp/download
