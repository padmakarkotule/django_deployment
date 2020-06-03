# Docker build and run
Build the image and then run the container,

#### Pre-requisite 
Create docker file and assume it's working. Test Dockerfile manually before build image.
E.g. Docker file here we are using as "Dockerfile_ui_service_with_gunicorn"

**Note -** 

Create separate Dockerfile for each service. Here we have created Dockerfile
with name as "Dockerfile_ui_service_with_gunicorn" and using with -f option. 
(-f option used to specify Dockerfile name) and use -t option to give tag option for
docker image.**


#### Build the image
E.g. docker build -t django_gunicorn:v1 .
docker build -t django_gunicorn -f Dockerfile_python_gunicorn_nginx .
    
    docker build -t ui_service -f Dockerfile_ui_service_with_gunicorn .

#### Run 
E.g. docker run --restart=always -p 8000:8000 -i -t django_gunicorn:v1
E.g. docker run -d --name django_gunicorn -it django_gunicorn
E.g. docker run -p 8081:8081 ui_service

    docker run -d --name ui_service -p 8081:8081 -it ui_service 
    
#### Connect to running container

    docker ps -a 
    # Get the container id and then connect e.g.
    docker exec -it 3b0c7580a59b /bin/sh


# NGINX 
#### NGINX configuration
Note - 
Scenario here is NGINX running on separate docker image and will connect to Django application
which is running in other docker container. Please note that we much need to specify
IP address of docker container running Django application in NGINX config file 
while using Reverse Proxy. 
E.g.
server{
listen 0.0.0.0:80;
server_name nginx_ui_service;
access_log /access.log;
error_log /error.log;

location /static {
    root /opt/ui_service/frontend/static;
}
location / {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_redirect off;
    if (!-f $request_filename ){
    #proxy_pass  http://ui_service:8081;
    proxy_pass  http://172.17.0.2:8081;
    break;
    }
}

## Configure nginx for ui_service

#### Build
Steps,
- Go to nginx folder and run following command,

    ` docker build -t nginx_ui_service -f Dockerfile_nginx_ui_service .`
    
#### Run 

    `docker run -d --name nginx_ui_service -p 80:80 -it nginx_ui_service`
    
#### Connect to running container

    docker ps -a 
    # Get the container id and then connect e.g.
    docker exec -it 3b0c7580a59b /bin/bash
