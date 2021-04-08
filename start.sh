#!/bin/bash

#Start Jenkins
docker build -t jenkins:ci_env ./dockerfiles/jenkins
docker run --name jenkins -d -p 8880:8080 -p 50000:50000 -v jenkins_volume:/var/jenkins_home jenkins:ci_env

#Start Artifactory
#docker build -t artifactory:ci_env ./dockerfiles/artifactory
