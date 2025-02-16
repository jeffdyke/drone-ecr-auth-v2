FROM python:3.11-alpine
RUN <<BASE
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update
apk add aws-cli docker bash
cat <<CONFIG > "/root/.aws/config"
[default]
region=us-east-1
CONFIG
cat <<CREDS > "/root/.aws/credentials"
[default]
credential_source=Ec2InstanceMetadata
region=us-east-1
CREDS
mkdir /root/.docker
BASE
