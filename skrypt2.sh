#!/bin/bash

#Utworzenie sieci bridge1
docker network create -d bridge --subnet 10.0.10.0/24 bridge1

#Utworzenie sieci bridge2
docker network create -d bridge --subnet 192.168.56.0/24 bridge2

#Utworzenie kontenera D1
docker run -itd --rm --name D1 --net bridge1 --ip 10.0.10.254 --network-alias host1 alpine sh

#Utworzenie kontenera S1
docker run -itd --rm --name S1 --net bridge2 --network-alias host2 ubuntu sh

#Utworzenie kontenera D2 
docker run -itd --rm --name D2 --net bridge1 -p 10.0.10.0:8080:80 --network-alias apa1  -p 192.168.56.0:8081:80 alpine

#Podłączenie kontenerów 
docker network connect --alias apa2 bridge2 D2
