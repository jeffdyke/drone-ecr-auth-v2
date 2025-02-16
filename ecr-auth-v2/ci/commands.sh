#!/usr/bin/env bash

set -o pipefail
set -e
operation=$1; shift

latestImage() {
  docker images | grep "jeffdyke/ecr-auth-v2" | awk '{print $3}' | sort | uniq
}
clean() {
  echo "$(latestImage)" | xargs sudo docker rmi --force 2>/dev/null || echo "No images to delete"
  sudo docker builder prune -f
}
build() {
  docker build --build-arg REGION=$REGION -t ecr-auth-v2 .
  docker tag ecr-auth-v2:latest jeffdyke/ecr-auth-v2:latest
}
push() {
  docker push jeffdyke/ecr-auth-v2
}
attach() {
  local latest=$(latestImage)
  if [ -z "$latest" ]; then
    echo "No image found"
    exit 1
  fi
  sudo docker run -it -v /var/run/docker.sock:/var/run/docker.sock $latest
}

test() {
  sudo docker run -t $(latestImage) "aws ecr get-login-password | docker login --username AWS --password-stdin 668874212870.dkr.ecr.us-east-1.amazonaws.com"
}

if [ ! -z $operation ]; then
  $operation
else
  echo "No operation was passed.  Pass one of clean, build, test"
fi
