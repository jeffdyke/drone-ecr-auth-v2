#!/usr/bin/env bash

set -o pipefail
set -e
operation=$1; shift
REPO="jeffdyke/ecr-auth-v2"
latestImage() {
  docker images | grep "${REPO}" | awk '{print $3}' | sort | uniq
}
clean() {
  echo "$(latestImage)" | xargs sudo docker rmi --force 2>/dev/null || echo "No images to delete"
  sudo docker builder prune -f
}
latestTag() {
  [ ! -z "$1"] && echo "$1" || echo "latest"
}
build() {
  local tag=$(latestTag $1)
  docker build --build-arg AWS_ACCOUNT=$AWS_ACCOUNT --build-arg REGION=$REGION -t ecr-auth-v2 .
  docker tag ecr-auth-v2:${tag} ${REPO}:${tag}
}

push() {
  docker push $REPO:latest
}
attach() {
  local latest=$(latestImage)
  if [ -z "$latest" ]; then
    echo "No image found"
    exit 1
  fi
  sudo docker run -it -v /var/run/docker.sock:/var/run/docker.sock $latest
}
pushStable() {
  docker tag ecr-auth-v2:latest ${REPO}:stable
  docker push ${REPO}:stable
  docker rmi ${REPO}:stable
}
test() {
  sudo docker run -t $(latestImage) "aws ecr get-login-password | docker login --username AWS --password-stdin"
}

if [ ! -z $operation ]; then
  $operation
else
  echo "No operation was passed.  Pass one of clean, build, test"
fi
