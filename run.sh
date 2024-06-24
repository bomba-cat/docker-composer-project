#!/bin/bash

read -p "Enter password: " pw

echo Changing directory
cd src/

echo Setting password secret
echo $pw > ./password.txt

echo Running docker-compose...
docker-compose up -d | echo --- && echo --- && echo Error executing: docker-compose up -d

echo Waiting for gitlab..
docker wait gitlab
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
