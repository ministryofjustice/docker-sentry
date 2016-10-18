#!/usr/bin/env bash

# Start up Sentry celery worker
/usr/bin/supervisord -c /srv/supervisord.conf
