#! /usr/bin/env bash

set -euxo pipefail
HUGO_PROJECT_PATH=$(cd $(dirname ${0}) && cd .. && pwd)

cd ${HUGO_PROJECT_PATH}

rm -rf .hugo_build.lock public resources
hugo server --disableFastRender --gc
