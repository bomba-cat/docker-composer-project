#!/bin/bash

read -p "Enter folder: " folder

echo Changing directory..
cd $folder

echo Setting env Variables...
set MYSQL_ROOT_PASSWORD=KUZ35_:3434FEfwew*1
set MYSQL_PASSWORD=KUZ35_:3434FEfwew*1

echo Running docker-compose...
docker-compose up -d | echo Error executing `docker-compose up -d`
