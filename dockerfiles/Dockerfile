FROM python:3.7.4-alpine
MAINTAINER Padmakar Kotule

COPY ./ui_service /ui_service
COPY ./requirement.txt /requirement.txt
WORKDIR /ui_service
RUN pip install -r /requirement.txt && pip install gunicorn==20.0.4
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]