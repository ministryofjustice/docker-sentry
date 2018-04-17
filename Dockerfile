FROM python:2.7-onbuild

ENV APP_HOME=/srv/

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y supervisor
RUN adduser --disabled-password --gecos "" sentry

# Install latest python

RUN pip install --upgrade -r requirements.txt
ADD . /srv
RUN chown -R sentry: /srv
RUN chmod 755 /srv/run.sh
RUN chown sentry:sentry /dev/stdout

USER sentry
WORKDIR /srv
EXPOSE 9000

CMD ["/srv/run.sh"]
