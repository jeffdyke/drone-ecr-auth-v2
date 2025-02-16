#!/usr/bin/env bash
set -o pipefail
set -e
if [ -z $REGION ]; then
  echo "Warning, no region found, setting to us-east-1"
  REGION=us-east-1
fi
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REGION=$REGION ${script_dir}/ci/commands.sh $1
