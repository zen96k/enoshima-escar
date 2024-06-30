FROM node:20

ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/usr/bin/bash", "-ecx"]

# ==============================
# Update apt config
# ==============================
RUN echo "APT::Install-Recommends false;" > /etc/apt/apt.conf.d/00-install-recommends && \
  echo "APT::Install-Suggests false;" > /etc/apt/apt.conf.d/00-install-suggests && \
  apt update

# ==============================
# Install hugo
# ==============================
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.128.0/hugo_extended_0.128.0_linux-amd64.deb && \
  apt install -y ./hugo_extended_0.128.0_linux-amd64.deb

# ==============================
# Purge unused packages
# ==============================
RUN apt update && \
  apt full-upgrade -y && \
  apt autopurge -y && \
  apt autoclean && \
  rm -rf /var/lib/apt/lists
