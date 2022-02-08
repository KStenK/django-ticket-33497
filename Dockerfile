FROM python:3.10.2-slim

ENV DJANGO_SETTINGS_MODULE=django_33497.settings
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONASYNCIODEBUG 1
ENV APP_HOME=/home/app/web

# copy project
COPY . $APP_HOME

# set work directory
WORKDIR $APP_HOME/django_33497

# update & upgrade image packages
RUN apt-get update && apt-get -y upgrade && apt-get -y full-upgrade && apt-get -y autoremove && \
    # install container dependencies
    apt-get -y install libpq-dev gcc netcat && \
    # install python dependencies
    pip install --no-cache --upgrade pip -r requirements.txt && \
    rm -rf /var/lib/apt/lists/*
