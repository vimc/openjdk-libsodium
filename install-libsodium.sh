#!/usr/bin/env bash
set -e

mkdir -p lib

libsodium_version=$(<libsodium-version)

curl https://download.libsodium.org/libsodium/releases/libsodium-${libsodium_version}.tar.gz \
    | tar xz --directory lib/

cd lib/libsodium-${libsodium_version}/

./configure
make
make check
make install

cd -

