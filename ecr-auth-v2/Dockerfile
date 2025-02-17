FROM python:3.13-alpine3.21

COPY config/.docker/config.json /root/.docker/config.json

RUN apk update && apk add --no-cache docker-cli bash docker-credential-ecr-login

ENTRYPOINT [ "/bin/bash" ]
