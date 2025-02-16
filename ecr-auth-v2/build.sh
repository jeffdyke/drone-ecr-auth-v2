#!/usr/bin/env bash
set -o pipefail
set -e
if [ -z $REGION ]; then
  echo "Warning, no region found, setting to us-east-1"
  REGION=us-east-1
fi
if [ -z $AWS_ACCOUNT ]; then
  echo "You must set AWS_ACCOUNT=123456778 with the proper value in order for authentication to work"
  exit 1
fi
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REGION=$REGION ${script_dir}/ci/commands.sh $1
