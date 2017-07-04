FROM jenkinsci/jnlp-slave

MAINTAINER dookie23 <dookie10@gmail.com>
USER root

ENV DOCKER_VERSION 1.12.6
ENV DOCKER_GID 497

RUN apt-get update && apt-get install -y git jq rsync g++ build-essential && apt-get clean

# Install Docker binary
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz && tar --strip-components=1 -xvzf docker-${DOCKER_VERSION}.tgz -C /usr/bin

RUN groupadd -g ${DOCKER_GID} docker
RUN sudo usermod -aG docker jenkins

USER jenkins
