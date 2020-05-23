# Use an official Python runtime as a parent image
FROM python:3.7.4-alpine
MAINTAINER Padmakar Kotule

# Set the working directory to /app
# WORKDIR /app
WORKDIR /ui_service

# Copy the current directory contents into the container at /app
#ADD . /app
COPY ./ui_service /ui_service

# Install python packages
RUN pip install -r /ui_service/requirement.txt && pip install gunicorn==20.0.4

# Make port 8081 available to the world outside this container
EXPOSE 8081

# Define environment variable
#ENV NAME World

# Add commoands in entrypoint.sh file and copy that files to folder and run commands.
COPY ./entrypoint.sh /entrypoint.sh

# Give executable permission to entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run app.py when the container launches
#CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8005"]
CMD ["sh", "/entrypoint.sh"]

# Run CMD using entrypoint.sh instead of using CMD command option in Dockerfile.
#ENTRYPOINT ["/entrypoint.sh"]