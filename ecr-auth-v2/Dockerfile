FROM alpine AS build

ARG REGION
ARG AWS_ACCOUNT

COPY config/.aws /root/.aws
COPY config/.docker/config.json /root/.docker/config.json
RUN <<BASE
apk update
apk add --no-cache moreutils envsubst
REGION=$REGION envsubst < /root/.aws/config | sponge /root/.aws/config
REGION=$REGION envsubst < /root/.aws/credentials | sponge /root/.aws/credentials
AWS_ACCOUNT=${AWS_ACCOUNT} REGION=${REGION} < /root/.docker/config.json | sponge /root/.docker/config.json
BASE

FROM python:3.13-alpine3.21
COPY --from=build /root/.aws /root/.aws
COPY --from=build /root/.docker /root/.docker
RUN apk update && apk add --no-cache aws-cli docker bash docker-credential-ecr-login


ENTRYPOINT [ "/bin/bash" ]
