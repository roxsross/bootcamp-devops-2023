FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y \
                          apt-transport-https \
                          ca-certificates \
                          curl \
                          gnupg \
                          jq \
                          git \
                          bash \
                          unzip \
                          zip \
                          wget \
                          lsb-release 
                      
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

RUN jenkins-plugin-cli \
    --plugins \
    workflow-support \
    pam-auth \
    sshd \
    ws-cleanup \
    ssh-agent \ 
    docker-workflow \ 
    blueocean \
    pipeline-utility-steps
