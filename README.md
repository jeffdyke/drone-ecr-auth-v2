# drone-ecr-auth-v2
Docker based authentication to ECR private repositories

Based on omerxx/drone-ecr-auth, but using awscliv2
This is an x86 image.

## AWS Requirements
You must align your AWS permissions (EC Permission -> Role) for all that you will use this image for.


## Pull Image
`docker pull jeffdyke/ecr-auth-v2:stable`

The `latest` tag is kept up to date with `stable`

## Build your own
```
cd ecr-auth-v2
./build.sh build
```

## Attach
`./build.sh attach`

Which is simply
```
docker run -it -v /var/run/docker.sock:/var/run/docker.sock $(docker images | grep "jeffdyke/ecr-auth-v2" | awk '{print $3}' | sort | uniq | head -1)
```

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
