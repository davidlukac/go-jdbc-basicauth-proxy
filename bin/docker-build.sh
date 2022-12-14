#!/usr/bin/env bash

# Arguments
# 1 - if provided used as image suffix

set -xe

source .env

declare APP_VER
declare APP_IMG

mkdir -p build

# Build.
docker build . \
  --build-arg APP_VER="${APP_VER}" \
  --target export \
  --output type=local,dest=build

ls -al build

# Package
docker build . \
  --file package.Dockerfile \
  --build-arg APP_VER="${APP_VER}" \
  -t "${APP_IMG}:${APP_VER}${1}"
