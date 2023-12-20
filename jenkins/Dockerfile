ARG JENKINS_VERSION=lts-slim
FROM jenkins/jenkins:$JENKINS_VERSION
LABEL maintainer="roxsross"

RUN jenkins-plugin-cli --plugins kubernetes \
    workflow-aggregator \
    git \
    github \
    configuration-as-code \
    matrix-auth \
    prometheus