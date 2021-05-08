#! /bin/zsh

sudo docker-compose -f conf/docker/haproxy/docker-compose.yaml up -d --build
sudo docker-compose -f conf/docker/jenkins/docker-compose.yaml up -d --build
sudo docker-compose -f conf/docker/gitlab/docker-compose.yaml up -d --build
sudo docker-compose -f conf/docker/sonar/docker-compose.yaml up -d --build
sudo docker-compose -f conf/docker/registry/docker-compose.yaml up -d --build
sudo docker-compose -f conf/docker/dns/docker-compose.yaml up -d --build
docker exec -it ns1-cicd /etc/init.d/bind9 restart