#!/bin/bash

#Utworzenie kontenera T1 
docker run  --rm --name T1 alpine

#Utworzenie sieci bridge1
docker network create --subnet 10.0.10.0/24 bridge1

#Utworzenie Kontenera T2 
docker run  --rm --name T2 --net bridge1 -p 10.0.10.0:8000:80  -p 80:80 nginx

#Utworzenie kontenera D1
docker run --rm --name D1 --net bridge1 --ip=10.0.10.254 alpine
