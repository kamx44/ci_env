#!/bin/bash

function init()
{
    echo "Init function"
    currentpath=`pwd`
    cd compose
    docker-compose up -d --build
    sleep 60
    cd {$currentpath}/configuration/artifactory
    import.sh
    cd {$currentpath}/configuration/jenkins
}

function compose()
{
    echo "Compose function"
    cd compose
    docker-compose up -d --build
}

function usage()
{
    echo -e "\nUsage:  start_compose.sh [OPTIONS]\n\n"
    echo -e "Set up environmnet script\n\n"
    echo -e "Options:\n\n"
    echo -e "\t-i, --init\tInitialize environment\n"
    echo -e "\t-c, --compose\tRun only docker-compose command\n"
    echo -e "\t-h, --help\tPrint help"
}
while [ "$1" != "" ]; do
    case $1 in
        -i | --init )       init
                            exit
                            ;;
        -c | --compose )    compose
                            exit
                            ;;
        -h | --help )       usage
                            exit
                            ;;
        * )                 usage
                            exit 1
    esac
    shift
done
usage



#cd compose
#docker-compose up -d --build