#!/usr/bin/env bash

set -x
set -o pipefail
set -e
operation=$1; shift

latestImage() {
  docker images | grep "jeffdyke/ecr-auth-v2" | awk '{print $3}'
}
clean() {
  echo "${latestImage}" | xargs sudo docker rmi --force || echo "No images to delete"
  sudo docker builder prune -f
}
build() {
  docker build --build-arg REGION=us-east-1 -t ecr-auth-v2 .
  docker tag ecr-auth-v2:latest jeffdyke/ecr-auth-v2:latest
}
push() {
  docker push jeffdyke/ecr-auth-v2
}

test() {
  sudo docker run -t $(latestImage) "aws ecr get-login-password | docker login --username AWS --password-stdin 668874212870.dkr.ecr.us-east-1.amazonaws.com"
}

if [ ! -z $operation ]; then
  $operation
else
  echo "No operation was passed.  Pass one of clean, build, test"
fi
