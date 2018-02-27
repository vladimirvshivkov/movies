#!/bin/bash
movCont=''
while [ "$movCont" = '' ]; do
    echo -n "Сколько нужно app контейнеров? "
    read movCont
    docker-compose up --build -d --scale movies=$movCont
done

sleep 10

pip install httpie

http http://127.0.0.1/ name='The Godfather (1972)' description='The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.' casts='Marlon Brando, Al Pacino, James Caan'
http http://127.0.0.1/ name='The Shawshank Redemption (1994)' casts='Tim Robbins, Morgan Freeman, Bob Gunton' description='Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'
http http://127.0.0.1/ name='The Godfather: Part II (1974)' casts='Al Pacino, Robert De Niro, Robert Duvall' description='The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.'
