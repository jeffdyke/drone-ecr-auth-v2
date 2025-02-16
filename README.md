# drone-ecr-auth-v2
Docker based authentication to ECR private repositories

Based on omerxx/drone-ecr-auth, but using awscliv2

### This is meant to be built on a x84 system

## Pull Image
`docker pull jeffdyke/ecr-auth-v2:stable`

## Build your own
```
cd ecr-auth-v2
AWS_ACCOUNT=123456789 REGION=co-area-n ./build.sh build
```
REGION will default to us-east-1 if omitted, otherwise, must be correct
Script will fail during a `build` if AWS_ACCOUNT is omitted.
## Attach
`./build.sh attach`

### While attached you should be able to run
`docker pull 123456789.dkr.ecr.us-east-1.amazonaws.com/repo:tag`

# Drone/CI

This is especially useful in `Drone` and other `CI` services so your containers to login

## Pull once
### Pull Step
```
- name: pull-images
    image: jeffdyke/ecr-auth-v2:stable
    volumes: &volumes
      - name: docker
        path: /var/run/docker.sock
    commands:
      - docker pull 123456789.dkr.ecr.us-east-1.amazonaws.com/repo:tag
```
### Other Steps
ensure `pull: never` is in any step where the image is pulled in `pull-images`
