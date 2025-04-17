#!/bin/bash

set -e # failOnStderr
# Début Chronomètre
SECONDS=0

REPOSITORY="ghcr.io/laveracloudsolutions"

# Pull and Push image to github
function push_to_github()
{
  DOCKER_IMAGE=$1
  docker pull ${DOCKER_IMAGE}
  docker tag ${DOCKER_IMAGE} ${REPOSITORY}/${DOCKER_IMAGE}
  docker push ${REPOSITORY}/${DOCKER_IMAGE}
}

# Build and Push image to github
function build_and_push_to_github()
{
  DOCKER_FOLDER=$1
  DOCKER_IMAGE=$2
  pushd ${DOCKER_FOLDER}
  docker rmi -f ${DOCKER_IMAGE}
  docker build --no-cache -t ${DOCKER_IMAGE} .
  docker push ${DOCKER_IMAGE}
  popd
}

push_to_github "dpage/pgadmin4:9.1"
push_to_github "dockage/mailcatcher:0.9"
push_to_github "maildev/maildev:2.2.1"
push_to_github "nginx:1.27.4"
push_to_github "node:20.16.0-bullseye"
push_to_github "node:21-bullseye-slim"
push_to_github "node:22.14.0-bullseye"
push_to_github "polinux/mkdocs:1.5.2"
push_to_github "php:8.3.13-apache-bookworm"
push_to_github "postgres:15.12-alpine"
push_to_github "postgres:16-alpine"
push_to_github "redis:5-alpine"
push_to_github "redis:7.2.5-bookworm"
push_to_github "ubuntu:20.04"
push_to_github "ubuntu:24.04"
push_to_github "wiremock/wiremock:3.9.2"
push_to_github "wiremock/wiremock:3.12.1"

# Custom Images
build_and_push_to_github "node-tools-20" "${REPOSITORY}/node-tools:20.16.0-01"
build_and_push_to_github "node-tools-21" "${REPOSITORY}/node-tools:21-01"
build_and_push_to_github "php-runner-8.3" "${REPOSITORY}/php-runner:8.3.13-01"
build_and_push_to_github "php-tools-8.3" "${REPOSITORY}/php-tools:8.3.13-01"

# Fin Chronomètre
DURATION=$SECONDS
echo "Execution Time: $((DURATION / 60)) minutes and $((DURATION % 60)) seconds."