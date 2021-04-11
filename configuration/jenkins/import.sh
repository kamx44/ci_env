#!/bin/bash

function usage()
{
    echo "help"
}

while [ "$1" != "" ]; do
    case $1 in
        -u | --user )       shift
                            username=$1
                            ;;
        -p | --password )   shift
                            password=$1
                            ;;
        -h | --help )       usage
                            exit
                            ;;
        * )                 usage
                            exit 1
                            ;;
    esac
shift
done

if [[ $username == "" || $password == "" ]]; then
    usage
    exit 1
fi

echo $username
echo $password

if ! [ -f "jenkins-cli.jar" ]; then
    wget http://192.168.33.33:8880/jnlpJars/jenkins-cli.jar
fi

#Import Jobs configuration
jobs=`ls jobs`

for job in $jobs
do
    job=`echo $job | cut -d '.' -f 1`
    java -jar jenkins-cli.jar -s http://192.168.33.33:8880/ -auth $username:$password -webSocket create-job $job < jobs/${job}.xml
done

jenkins_volume="/var/lib/docker/volumes/compose_jenkins_volume/_data"
docker stop jenkins
rm ${jenkins_volume}/identity.key.enc
tar xzvf credentials/credentials.tgz -C ${jenkins_volume}/
docker start jenkins