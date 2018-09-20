FROM ubuntu:latest

WORKDIR /

RUN apt-get update \
    && apt-get upgrade -yq \
    && apt-get install -yq lcov git-core curl unzip \
    && git clone --single-branch -b beta https://github.com/flutter/flutter.git \
    && /flutter/bin/flutter doctor \
    && apt-get remove -y curl unzip \
    && apt-get autoremove -yq \
    && apt-get autoclean -yq \
    && rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
