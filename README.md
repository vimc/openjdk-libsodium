# docker-libsodium
Contains a docker file for an image based on `openjdk` with `libsodium` installed, and script to build, tag and push
the image to the vimc registry.

## building
Run `./build-image.sh` to build and push to the vimc registry. This script is also run on Teamcity.

## usage
This image is used by [Montagu-Api](https://github.com/vimc/montagu-api-Api) 
and [Kodiak](https://github.com/vimc/kodiak). 