#!/bin/bash

#Crate docker  network
docker network create docker_network
#---Start Jenkins---
#check if volume exist if not create a new one
docker volume inspect jenkins_volume || docker volume create jenkins_volume;
#build and run jenkins
docker build -t jenkins:ci_env ./dockerfiles/jenkins
docker run --name jenkins -d -p 8880:8080 -p 50000:50000 --net docker_network -v jenkins_volume:/var/jenkins_home jenkins:ci_env

#---Start Artifactory---
#check if volume exist if not create a new one
#docker volume inspect artifactory_volume || docker volume create artifactory_volume;
#build and run jenkins
#docker build -t artifactory:ci_env ./dockerfiles/artifactory
#docker run --name artifactory -d -p 8081:8081 -p 8082:8082 --net docker_network -v artifactory_volume:/var/opt/jfrog/artifactory artifactory:ci_env

#--Start Selenium HUB
#docker build -t selenium-hub:ci_env ./dockerfiles/selenium/hub
#docker run --name selenium-hub -d -p 4444:4444 --net docker_network selenium-hub:ci_env

#--Start Selenium Node
#docker build -t selenium-node:ci_env ./dockerfiles/selenium/node
#docker run --name selenium-node -d --net docker_network selenium-node:ci_env


#--Start slave server
#docker build -t ubuntuslave:ci_env ./dockerfiles/slave
#docker run --name slave -t -d --net docker_network -v /var/run/docker.sock:/var/run/docker.sock -p 8088:8088 ubuntuslave:ci_env