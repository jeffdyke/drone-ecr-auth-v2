FROM python:3.13-alpine3.21

ARG REGION

# COPY config/.aws /root/.aws
COPY config/.docker/config.json /root/.docker/config.json
RUN <<BASE
apk update
# sed -i'' "s:REGION_TMPL:${REGION}" /root/.aws/config
# REGION=$REGION envsubst < /root/.aws/config | sponge /root/.aws/config
# REGION=$REGION envsubst < /root/.aws/credentials | sponge /root/.aws/credentials
apk update && apk add --no-cache docker-cli bash docker-credential-ecr-login
BASE

ENTRYPOINT [ "/bin/bash" ]
