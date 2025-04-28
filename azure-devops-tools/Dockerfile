# docker build -t azure-devops-tools:dev .
FROM ubuntu:24.04
RUN apt-get update  && \
    apt-get dist-upgrade -y && \
    apt-get install -qy \
      curl libicu-dev jq git

# Install Azure Cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
#RUN curl -sSL https://get.docker.com/ | sh
RUN az upgrade
RUN az extension add --name azure-devops
RUN mkdir -p /code