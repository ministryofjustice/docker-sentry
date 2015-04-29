FROM phusion/baseimage:0.9.16

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y python-pip python-dev postgresql-client libxml2-dev libxslt1-dev zlib1g-dev libpq-dev libffi-dev redis-server supervisor

RUN adduser --disabled-password --gecos "" sentry

RUN pip install -U sentry[postgres]

RUN mkdir -p /srv/redis /srv/log

ADD . /srv
RUN chown -R sentry: /srv
RUN chmod 755 /srv/run.sh

USER sentry
WORKDIR /srv
EXPOSE 9000

ENTRYPOINT ["/srv/run.sh"]
