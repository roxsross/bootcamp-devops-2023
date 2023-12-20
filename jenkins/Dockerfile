FROM jenkins/jenkins:lts
USER root
RUN curl https://get.docker.com > dockerinstall && chmod 777 dockerinstall && ./dockerinstall && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
USER jenkins
RUN jenkins-plugin-cli --plugins kubernetes \
    workflow-aggregator \
    git \
    github \
    configuration-as-code \
    matrix-auth \
    prometheus