ARG OPEN_JDK_BASE=openjdk:8
FROM $OPEN_JDK_BASE

RUN apt-get update
RUN apt-get install -y build-essential

COPY . .
RUN ./install-libsodium.sh
