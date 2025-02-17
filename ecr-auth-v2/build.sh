#!/usr/bin/env bash
set -o pipefail
set -e
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
${script_dir}/ci/commands.sh $1
