#!/bin/bash

apt-get install unzip -y
unzip ./configuration/artifactory/settings.zip -d /var/lib/docker/volumes/compose_artifactory_volume/_data/settings
curl -u admin:password -H "Content-Type: application/json" -X POST --data '{"importPath": "settings"}' "http://192.168.33.33:8081/artifactory/api/import/system"