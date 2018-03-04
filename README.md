# movies
An application for storing a movie library, a server infrastructure that allows you to automatically deploy and scale the system if necessary, without modifying the application and storage system.
The application is built on a micro-service architecture that includes python applications connected to mongodb via REST api.
Python application uses flask and eve framework which is very human-friendly.

Starts from bash script make_movies. Script builds requested number of app docker containers and connects them in right order.
Schema of DB is described in setting.py

It works on docker swarm, and before you run script, you need to initialize swarm.

First, you need to pull git, and cd to folder.
Then, run make_movies.sh, script will create all services, network and stuff. 
If you would like to scale movies app, 
just type in terminal 
"docker service scale movies-app=7" for 7 or any app you would like.
