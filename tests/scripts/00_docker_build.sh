#!/usr/bin/env bash

PROJECT_PREFIX="perlur"

IMAGE_NAME="centos-base"
BASE_NAME=${PROJECT_PREFIX}-${IMAGE_NAME}
docker build -t ${BASE_NAME} ./${IMAGE_NAME}

IMAGE_NAME="centos-nginx"
BASE_NAME=${PROJECT_PREFIX}-${IMAGE_NAME}
docker build -t ${BASE_NAME} ./${IMAGE_NAME}
docker build -t perlur/centos-base ./centos-nginx\

IMAGE_NAME="centos-nginx-php-fpm"
BASE_NAME=${PROJECT_PREFIX}-${IMAGE_NAME}
docker build -t ${BASE_NAME} ./${IMAGE_NAME}