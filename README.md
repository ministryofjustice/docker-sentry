# docker-sentry

Install for the first time, this will setup the DB and enable you to create the first user

WARNING: Only run this once on new environments
```
/usr/local/bin/sentry --config=/srv/sentry.conf.py upgrade
/usr/local/bin/sentry --config=/srv/sentry.conf.py createuser

```
