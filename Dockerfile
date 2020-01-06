FROM openjdk

ARG libsodium_version='1.0.18'

RUN apt-get update
RUN apt-get install -y build-essential

RUN mkdir /build && \
        curl "https://download.libsodium.org/libsodium/releases/libsodium-${libsodium_version}.tar.gz" | \
                tar xz --directory /build --strip 1 && \
        cd /build && \
        ./configure && \
        make all check install && \
        rm -rf /build
