#!/bin/bash
set -e

DEFAULT_IMAGE_NAME="crazy/container"
DEFAULT_PC_HOST_PORT="80-90"
DEFAULT_CONTAINER_PORT="80"

read -p "Image name (default: ${DEFAULT_IMAGE_NAME}): " IMAGE_NAME
IMAGE_NAME=${IMAGE_NAME:-${DEFAULT_IMAGE_NAME}}

read -p "Host port (default: ${DEFAULT_PC_HOST_PORT}): " PC_HOST_PORT
PC_HOST_PORT=${PC_HOST_PORT:-${DEFAULT_PC_HOST_PORT}}

read -p "Container port (default: ${DEFAULT_CONTAINER_PORT}): " CONTAINER_PORT
CONTAINER_PORT=${CONTAINER_PORT:-${DEFAULT_CONTAINER_PORT}}

docker build -t ${IMAGE_NAME} . &&
  docker run -d --rm -p ${PC_HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}
