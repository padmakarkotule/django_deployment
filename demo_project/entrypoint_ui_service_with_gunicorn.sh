#!/bin/sh

# Define variables
# Django project name is ui_servie. Replace project name as per your project.
# django_project_name="ui_service"
# bind_ip="0.0.0.0"
# bind_port="8081"
# workers=4
# log_level="info"
# log_file="./logs/gunicorn.log"
# access_logfile="./logs/gunicorn-access.log"
# export DJANGO_SETTINGS_MODULE=${django_project_name}.settings

#
# special variable $@, which means, ‘All of the command-line arguments to the shell script’.
# exec gunicorn ${django_project_name}.wsgi:application \
# -- name ${django_project_name}
# --bind ${bind_ip}:bind_port
# --workers ${workers}
# -log-level=${log_level}
# --log-file=${log_file}
# access-logfile=${access_logfile}


# Prepare log files and start outputting logs to stdout
touch ./logs/gunicorn.log
#touch ./logs/gunicorn-access.log
#tail -n 0 -f ./logs/gunicorn*.log &

export DJANGO_SETTINGS_MODULE=ui_service.settings
exec gunicorn ui_service.wsgi:application \
    --name ui_service \
    --bind 0.0.0.0:8081 \
    --workers 4 \
    --log-level=info \
    --log-file=../logs/gunicorn.log \
"$@"

# --log-level=info \
#    --log-file=./logs/gunicorn.log \
#    --access-logfile=./logs/gunicorn-access.log \
