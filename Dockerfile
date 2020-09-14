FROM openjdk:8

RUN apt-get update
RUN apt-get install -y build-essential

COPY . .
RUN ./install-libsodium.sh
