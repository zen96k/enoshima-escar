#! /usr/bin/env bash

set -euxo pipefail
SCRIPT_DIRNAME=$(cd $(dirname ${0}) && pwd)

cd ${SCRIPT_DIRNAME}

rm -rf ${HOME}/.gitconfig
git config --global init.defaultBranch ${GIT_INIT_DEFAULT_BRANCH}
git config --global user.name ${GIT_USER_NAME}
git config --global user.email ${GIT_USER_EMAIL}

fastfetch
