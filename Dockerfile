FROM openjdk

# Install libsodium
RUN apt-get update && apt-get install -y \
        build-essential \
        software-properties-common

COPY ./install-libsodium.sh .
RUN ./install-libsodium.sh
