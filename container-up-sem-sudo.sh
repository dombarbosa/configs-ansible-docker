#! /bin/bash

docker-compose -f conf/docker/jenkins/docker-compose.yaml up -d --build
docker-compose -f conf/docker/gitlab/docker-compose.yaml up -d --build
docker-compose -f conf/docker/sonar/docker-compose.yaml up -d --build
docker-compose -f conf/docker/registry/docker-compose.yaml up -d --build


#sudo docker-compose -f conf/docker/sonar/docker-compose.yaml