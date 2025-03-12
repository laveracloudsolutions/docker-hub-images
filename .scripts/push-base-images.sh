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