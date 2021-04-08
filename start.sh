#!/bin/bash

#---Start Jenkins---
#check if volume exist if not create a new one
docker volume inspect jenkins_volume || docker volume create jenkins_volume;
#build and run jenkins
docker build -t jenkins:ci_env ./dockerfiles/jenkins
docker run --name jenkins -d -p 8880:8080 -p 50000:50000 -v jenkins_volume:/var/jenkins_home jenkins:ci_env

#---Start Artifactory---
#check if volume exist if not create a new one
docker volume inspect artifactory_volume || docker volume create artifactory_volume;
#build and run jenkins
docker build -t artifactory:ci_env ./dockerfiles/artifactory
docker run --name artifactory -d -p 8081:8081 -p 8082:8082 -v artifactory_volume:/var/opt/jfrog/artifactory artifactory:ci_env
