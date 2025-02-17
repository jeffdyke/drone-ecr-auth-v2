#!/usr/bin/env sh
if [[ -z "${REGION}" || -z "${AWS_ACCOUNT}" ]]; then
  echo "You must set REGION and AWS_ACCOUNT current values Region: $REGION, AWS: $AWS_ACCOUNT"
  exit 1
fi
REGION=$REGION envsubst < /root/.aws/config | sponge /root/.aws/config
REGION=$REGION envsubst < /root/.aws/credentials | sponge /root/.aws/credentials
AWS_ACCOUNT=${AWS_ACCOUNT} REGION=${REGION} envsubst < /root/.docker/config.json | sponge /root/.docker/config.json
