#!/bin/bash
echo "Running command"
exec gunicorn ui_service.wsgi:application --name ui_service --bind 0.0.0.0:8081