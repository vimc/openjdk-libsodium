#!/usr/bin/env bash
set -e

HERE=$(dirname $0)
CONFIG_PATH=$(realpath ./$HERE/libsodium-version)
LIBSODIUM_VERSION=$(<$CONFIG_PATH)

mkdir /build &&
  curl "https://download.libsodium.org/libsodium/releases/libsodium-${LIBSODIUM_VERSION}.tar.gz" |
  tar xz --directory /build --strip 1 &&
  cd /build &&
  ./configure &&
  make all check install &&
  rm -rf /build
