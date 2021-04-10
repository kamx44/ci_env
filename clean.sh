#!/bin/bash

docker rm -f jenkins
docker rmi jenkins:ci_env
docker rm -f artifactory
docker rmi artifactory:ci_env
docker rm -f selenium-hub
docker rmi selenium-hub:ci_env
docker rm -f selenium-node
docker rmi selenium-node:ci_env