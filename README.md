# docker-sentry

Install for the first time, this will setup the DB and enable you to create the first user

WARNING: Only run this once on new environments
```
sentry --config=/home/sentry/sentry.conf.py upgrade
sentry --config=/home/sentry/sentry.conf.py createuser

```
