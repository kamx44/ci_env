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

echo $username
echo $password

if ! [ -f "jenkins-cli.jar" ]; then
    wget http://192.168.33.33:8880/jnlpJars/jenkins-cli.jar
fi

jobs=`java -jar jenkins-cli.jar -s http://192.168.33.33:8880/ -auth $username:$password -webSocket list-jobs`

for job in $jobs
do
    java -jar jenkins-cli.jar -s http://192.168.33.33:8880/ -auth $username:$password -webSocket get-job $job > jobs/${job}.xml
done

#Export credentials
jenkins_volume="/var/lib/docker/volumes/compose_jenkins_volume/_data"
tar czvf credentials/credentials.tgz ${jenkins_volume}/secret* ${jenkins_volume}/credentials.xml