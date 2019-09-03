FROM ubuntu

## DOCKER CE CLI
RUN apt-get update && apt-get install -y \
    openjdk-8-jre \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" \
   && apt-get update \
   && apt-get install -y docker-ce-cli

## JENKINS SERVER
RUN useradd --create-home --user-group --shell /bin/bash jenkins

ENV JENKINS_HOME /var/jenkins_home
RUN mkdir ${JENKINS_HOME} \
   && mkdir -p /opt/jenkins \
   && chown -R jenkins:jenkins ${JENKINS_HOME} \
   && chown -R jenkins:jenkins /opt/jenkins

WORKDIR /opt/jenkins

ENV JENKINS_VER 2.176.3
RUN curl -OL --silent http://mirrors.jenkins.io/war-stable/${JENKINS_VER}/jenkins.war

USER jenkins
ENTRYPOINT ["java", "-jar", "jenkins.war"]