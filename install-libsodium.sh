#!/usr/bin/env bash
set -e

mkdir -p lib
here=$(dirname $0)
config_path=$(realpath ./$here/libsodium-version)
libsodium_version=$(<$config_path)

curl https://download.libsodium.org/libsodium/releases/libsodium-${libsodium_version}.tar.gz \
    | tar xz --directory lib/

cd lib/libsodium-${libsodium_version}/

./configure
make
make check
make install

cd -
