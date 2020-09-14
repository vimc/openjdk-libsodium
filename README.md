# openjdk-libsodium
Contains a script for installing [libsodium](https://libsodium.gitbook.io/doc/),
 a docker file for an image based on `openjdk` with `libsodium`
 installed, and a script to build, tag and push the image to docker hub.

## building
Run `./build-image.sh` to build and push to docker hub. This script is also run on Buildkite.

## usage
* The image `vimc/openjdk-libsodium:master` is used as a base image for various images 
built by [Montagu-API](https://github.com/vimc/montagu-api).
 
* To install libsodium locally: `sudo ./install-libsodium.sh`. In particular this is needed for local development 
of [Montagu-API](https://github.com/vimc/montagu-api).
