FROM jenkins/jenkins:lts

RUN curl -fsSL https://get.docker.com -o get-docker.sh \
  && sh get-docker.sh
