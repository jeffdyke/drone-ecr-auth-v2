FROM alpine/java:21-jdk
RUN mkdir /root/.aws
COPY config/.aws/config /root/.aws/config
COPY config/.aws/credentials /root/.aws/credentials
RUN <<BASE
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update
apk add aws-cli docker bash
mkdir /root/.docker
BASE
