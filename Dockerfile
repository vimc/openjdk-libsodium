FROM openjdk

# Install libsodium
RUN apt-get update
RUN apt-get install -y build-essential

COPY ./install-libsodium.sh .
RUN ./install-libsodium.sh
