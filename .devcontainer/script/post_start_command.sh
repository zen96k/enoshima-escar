#! /usr/bin/env bash

set -euxo pipefail

rm -rf "${HOME}"/.gitconfig
git config --global init.defaultBranch "${GIT_INIT_DEFAULT_BRANCH}"
git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"

apt update && apt -y install zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh)" "" --unattended
chsh -s "$(which zsh)"
cp -rfv .zshrc "${HOME}"

apt update && apt -y install shellcheck
go install mvdan.cc/sh/v3/cmd/shfmt@latest

rm -rf public resources .hugo_build.lock
