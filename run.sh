#!/usr/bin/env bash

# Start Supervisor (autostart Redis)
/usr/bin/supervisord -c /srv/supervisord.conf

# Wait for Redis to accept connections before continuing
while ! echo exit | nc localhost 6379; do sleep 2; done

# Start up Sentry celery worker
/usr/bin/supervisorctl -c /srv/supervisord.conf start worker

# Start the main Sentry service
/usr/local/bin/sentry --config=/srv/sentry.conf.py start
