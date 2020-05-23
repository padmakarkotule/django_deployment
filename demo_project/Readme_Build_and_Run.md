# Docker build and run
Finally we can then build the image and then run the container,

#### Build 
E.g. docker build -t django_gunicorn:v1 .
    
    docker build -t ui_service -f Dockerfile_ui_service_with_gunicorn .

#### Run 
E.g. docker run --restart=always -p 8000:8000 -i -t django_gunicorn:v1
E.g. docker run -p 8081:8081 ui_service

    docker run -d -p 8081:8081 -it ui_service 
    
#### Connect to running container

    docker ps -a 
    # Get the container id and then connect e.g.
    docker exec -it 3b0c7580a59b /bin/sh
