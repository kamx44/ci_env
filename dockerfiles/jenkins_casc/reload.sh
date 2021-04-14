#!/bin/bash

sudo docker rm -f jenkins-casc
sudo docker build -t jenkins-casc:ci_env .
sudo docker run -d --name jenkins-casc -p 8880:8080 -p 50000:50000 jenkins-casc:ci_env