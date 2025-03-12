#!/bin/bash

set -e # failOnStderr

REPOSITORY="ghcr.io/laveracloudsolutions"

# Script de génération des certificats utiles à l'activation de HTTPS
function push_to_github()
{
  DOCKER_IMAGE=$1
  docker pull ${DOCKER_IMAGE}
  docker tag ${DOCKER_IMAGE} ${REPOSITORY}/${DOCKER_IMAGE}
  docker push ${REPOSITORY}/${DOCKER_IMAGE}
}

push_to_github "php:8.3.13-apache-bookworm"
push_to_github "postgres:15.12-alpine"
push_to_github "wiremock/wiremock:3.9.2"
push_to_github "dpage/pgadmin4:9.1"
push_to_github "polinux/mkdocs:1.5.2"
