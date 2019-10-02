FROM python:3.7.4-slim-buster
MAINTAINER Nasa <nasa.freaks@gmail.com>

ENV INSTALL_PATH /flasky
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENV FLASK_APP=hello.py

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "hello:create_app()"

