FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ARG FASTFETCH_VERSION=2.18.1
ARG HUGO_VERSION=0.128.2

# SHELL ["/usr/bin/bash", "-ecx"]
SHELL ["/usr/bin/bash", "-ecuxo", "pipefail"]

# ==============================
# Update apt config
# ==============================
RUN echo "APT::Install-Recommends false;" > /etc/apt/apt.conf.d/00-install-recommends && \
    echo "APT::Install-Suggests false;" > /etc/apt/apt.conf.d/00-install-suggests && \
    apt update

# ==============================
# Install packages
# ==============================
RUN apt install -y \
    ca-certificates \
    curl wget \
    git \
    tzdata \
    zip unzip \
    rsync

# ==============================
# Install fastfetch
# ==============================
RUN wget https://github.com/fastfetch-cli/fastfetch/releases/download/${FASTFETCH_VERSION}/fastfetch-linux-amd64.deb && \
    apt install -y ./fastfetch-linux-amd64.deb

# ==============================
# Install hugo
# ==============================
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.deb && \
    apt install -y ./hugo_${HUGO_VERSION}_linux-amd64.deb

# ==============================
# Purge unused packages
# ==============================
RUN apt update && \
    apt full-upgrade -y && \
    apt autopurge -y && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists
