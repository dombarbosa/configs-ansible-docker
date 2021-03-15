#! /bin/bash

docker-compose -f conf/docker/jenkins/docker-compose.yaml down -v
docker-compose -f conf/docker/gitlab/docker-compose.yaml down -v
docker-compose -f conf/docker/sonar/docker-compose.yaml down -v
docker-compose -f conf/docker/registry/docker-compose.yaml down -v


#sudo docker-compose -f conf/docker/sonar/docker-compose.yaml