#!/usr/bin/env bash
set -e

if [ "$BUILDKITE" = "true" ]; then
    GIT_ID=${BUILDKITE_COMMIT:0:7}
else
    GIT_ID=$(git rev-parse --short=7 HEAD)
fi

if [ "$BUILDKITE" = "true" ]; then
    GIT_BRANCH=$BUILDKITE_BRANCH
else
    GIT_BRANCH=$(git symbolic-ref --short HEAD)
fi
ORG=vimc
NAME=openjdk-libsodium

APP_DOCKER_COMMIT_TAG=${ORG}/${NAME}:${GIT_ID}-8
APP_DOCKER_BRANCH_TAG=${ORG}/${NAME}:${GIT_BRANCH}-8

docker build \
    --pull \
    --tag ${APP_DOCKER_BRANCH_TAG} \
    --tag ${APP_DOCKER_COMMIT_TAG} \
    .

docker push ${APP_DOCKER_BRANCH_TAG}
docker push ${APP_DOCKER_COMMIT_TAG}

APP_DOCKER_COMMIT_TAG=${ORG}/${NAME}:${GIT_ID}-11
APP_DOCKER_BRANCH_TAG=${ORG}/${NAME}:${GIT_BRANCH}-11

docker build \
    --pull \
    --build-arg OPEN_JDK_BASE=openjdk:11 \
    --tag ${APP_DOCKER_BRANCH_TAG} \
    --tag ${APP_DOCKER_COMMIT_TAG} \
    .

docker push ${APP_DOCKER_BRANCH_TAG}
docker push ${APP_DOCKER_COMMIT_TAG}
