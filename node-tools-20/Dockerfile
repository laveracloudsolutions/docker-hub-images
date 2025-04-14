# crdevopsregistrynortheu001.azurecr.io/custom-node:20.16.0
FROM ghcr.io/laveracloudsolutions/node:20.16.0-bullseye

# install latest Google Chrome which will be used for running unit tests
RUN \
  apt update && \
  apt install -y chromium && \
  apt install -y openjdk-17-jre \
  && apt clean

# "fake" dbus address to prevent errors
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

ENV CHROME_BIN=/usr/bin/chromium

# Install Angular ng CLI
RUN npm install -g @angular/cli

# Install commitizen
RUN npm install -g commitizen

# Set the default shell to bash instead of sh
ENV SHELL=/bin/bash

USER node