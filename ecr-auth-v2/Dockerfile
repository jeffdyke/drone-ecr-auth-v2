FROM alpine3.21 AS build

ARG REGION
ARG PRIVATE_REPO="foo"
RUN mkdir /root/.aws
COPY config/.aws/config /root/.aws/config
COPY config/.aws/credentials /root/.aws/credentials
RUN <<BASE
apk update
apk add moreutils envsubst
REGION=$REGION envsubst < /root/.aws/config | sponge /root/.aws/config
REGION=$REGION envsubst < /root/.aws/credentials | sponge /root/.aws/credentials
BASE

FROM python:3.13-alpine3.21
COPY --from=build /root/.aws /root/.aws
RUN apk update && apk add aws-cli docker bash


ENTRYPOINT [ "/bin/bash" ]
# FROM alpine/java:21-jdk as runner
# COPY --from=build --chown=root:root /root/.aws /root/.aws
