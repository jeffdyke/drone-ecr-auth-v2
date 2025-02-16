FROM alpine AS build

ARG REGION
ARG PRIVATE_REPO="foo"
RUN mkdir /root/.aws
COPY config/.aws/config /root/.aws/config
COPY config/.aws/credentials /root/.aws/credentials
RUN <<BASE
apk update
apk add --no-cache moreutils envsubst
REGION=$REGION envsubst < /root/.aws/config | sponge /root/.aws/config
REGION=$REGION envsubst < /root/.aws/credentials | sponge /root/.aws/credentials
BASE

FROM python:3.13-alpine3.21
COPY --from=build /root/.aws /root/.aws
RUN apk update && apk add --no-cache aws-cli docker bash
ENTRYPOINT [ "/bin/bash" ]
