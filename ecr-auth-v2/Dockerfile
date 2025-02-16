FROM alpine/java:21-jdk

ARG REGION
ARG PRIVATE_REPO="foo"
RUN mkdir /root/.aws
COPY config/.aws/config /root/.aws/config
COPY config/.aws/credentials /root/.aws/credentials
RUN <<BASE
apk update
apk add aws-cli docker bash moreutils envsubst
REGION=$REGION envsubst < /root/.aws/config | sponge /root/.aws/config
REGION=$REGION envsubst < /root/.aws/credentials | sponge /root/.aws/credentials
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
mkdir -v /root/.docker
BASE

ENTRYPOINT [ "/bin/sh" ]
# FROM alpine/java:21-jdk as runner
# COPY --from=build --chown=root:root /root/.aws /root/.aws
