#!/usr/bin/env bash

DOCKER_PROJECT_PREFIX="perlur"

IMAGE_NAME="centos-base"
BASE_NAME=${DOCKER_PROJECT_PREFIX}-${IMAGE_NAME}
docker build -t ${BASE_NAME} ./${IMAGE_NAME}

IMAGE_NAME="centos-nginx"
BASE_NAME=${DOCKER_PROJECT_PREFIX}-${IMAGE_NAME}
docker build -t ${BASE_NAME} ./${IMAGE_NAME}

IMAGE_NAME="centos-nginx-php-fpm"
BASE_NAME=${DOCKER_PROJECT_PREFIX}-${IMAGE_NAME}
docker build -t ${BASE_NAME} ./${IMAGE_NAME}
