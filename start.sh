#!/usr/bin/env bash


while ! docker system info > /dev/null 2>&1; do sleep 1; done
echo "Docker is running. Building services..."

docker-compose build && \
  docker-compose run --rm runner
