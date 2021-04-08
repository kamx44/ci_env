#!/bin/bash

docker rm -f jenkins
docker rmi jenkins:ci_env
docker rm -f artifactory
docker rmi artifactory:ci_env