#!/usr/bin/env bash

clean() {
  docker images | grep ecr-auth | awk '{print $3}' | sort | uniq | xargs sudo docker rmi --force
  sudo docker builder prune -f
}
build() {
  docker build --build-arg REGION=us-east-1 -t ecr-auth-v2 ecr-auth-v2
  docker tag ecr-auth-v2:latest jeffdyke/ecr-auth-v2:latest
}
push() {
  docker push jeffdyke/ecr-auth-v2
}
