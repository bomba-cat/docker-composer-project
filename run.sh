#!/bin/bash

read -p "Enter folder: " folder

echo Changing directory..
cd $folder

echo "KUZ35_:3434FEfwew*1" > ./password.txt

echo Running docker-compose...
docker-compose up -d | echo --- && echo --- && echo Error executing: docker-compose up -d

echo Waiting for gitlab..
docker wait gitlab
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
