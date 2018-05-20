FROM jenkins/jenkins:latest

MAINTAINER Deepesh Pathak <deepshpathak@gmail.com>

ENV TERM xterm

USER root

RUN apt-get update
RUN apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL get.docker.com | sh
RUN usermod -aG docker jenkins

COPY ./jenkins_docker.sh /jenkins_docker.sh

USER jenkins

ENTRYPOINT ["/sbin/tini", "--", "/jenkins_docker.sh"]

