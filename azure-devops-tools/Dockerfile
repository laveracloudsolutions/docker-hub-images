# docker build -t azure-devops-tools:dev .
FROM ubuntu:24.04
RUN apt -y update
RUN apt -y install curl libicu-dev jq git
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
#RUN curl -sSL https://get.docker.com/ | sh
RUN az upgrade
RUN az extension add --name azure-devops
RUN mkdir -p /code