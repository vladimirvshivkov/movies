# movies
An application for storing a movie library, a server infrastructure that allows you to automatically deploy and scale the system if necessary, without modifying the application and storage system.
The application is built on a micro-service architecture that includes python applications connected to mongodb via REST api.
Python application uses flask and eve framework which is very human-friendly.

Starts from bash script make_movies. Script builds requested number of app docker containers and connects them in right order.
Schema of DB is described in setting.py
