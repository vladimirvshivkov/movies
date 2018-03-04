#!/bin/bash
#lets build images first
echo "Building docker images"
cd nginx
docker build -t enrrou/nginx .
cd ../movies
docker build -t enrrou/movies .
cd ../mongo
docker build -t mongo ../mongo

#make overlay network
docker network create -d overlay movienet

#create app service
appCont=''
while [ "$movCont" = '' ]; do
    echo -n "Сколько нужно app контейнеров? "
    read movCont
    docker service create --name movies-app --replicas $movCont --network movienet enrrou/movies
done

#create mongo service
docker service create --name mongo --replicas 1 --network movienet mongo:latest

#create nginx service
docker service create --name nginx --replicas 1 --network movienet -p 80:80 enrrou/nginx

sleep 10

pip install httpie

http http://127.0.0.1/movies name='The Godfather (1972)' description='The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.' casts='Marlon Brando, Al Pacino, James Caan'
http http://127.0.0.1/movies name='The Shawshank Redemption (1994)' casts='Tim Robbins, Morgan Freeman, Bob Gunton' description='Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'
http http://127.0.0.1/movies name='The Godfather: Part II (1974)' casts='Al Pacino, Robert De Niro, Robert Duvall' description='The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.'