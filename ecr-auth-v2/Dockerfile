FROM python:3.13-alpine3.21

COPY config/.aws /root/.aws
COPY config/.docker/config.json /root/.docker/config.json
COPY config/entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
RUN apk update && apk add --no-cache moreutils envsubst docker-cli bash docker-credential-ecr-login


ENTRYPOINT [ "/entrypoint.sh" ]
