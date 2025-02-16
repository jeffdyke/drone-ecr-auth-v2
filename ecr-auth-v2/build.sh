#!/usr/bin/env bash
set -o pipefail
set -e

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source ${script_dir}/ci/build.sh

clean
build
