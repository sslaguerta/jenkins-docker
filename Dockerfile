FROM jenkins/jenkins:lts
USER root

# Replace 999 below with the actual docker GID on your host
ARG DOCKER_GID=1001

RUN groupadd -g ${DOCKER_GID} docker \
  && usermod -aG docker jenkins

# Install Docker CLI binaries as you already do
RUN mkdir -p /tmp/download && \
    curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
    rm -rf /tmp/download/docker/dockerd && \
    mv /tmp/download/docker/docker* /usr/local/bin/ && \
    rm -rf /tmp/download

USER jenkins
