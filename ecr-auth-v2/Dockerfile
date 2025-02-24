FROM alpine3.21

COPY config/.docker/config.json /root/.docker/config.json

RUN apk add --no-cache --update docker-cli docker-credential-ecr-login

ENTRYPOINT [ "/bin/sh" ]
