#!/usr/bin/env bash

docker build --build-arg REGION=us-east-1 -t ecr-auth-v2 ecr-auth-v2
docker tag ecr-auth-v2:latest jeffdyke/ecr-auth-v2:latest
docker push jeffdyke/ecr-auth-v2
