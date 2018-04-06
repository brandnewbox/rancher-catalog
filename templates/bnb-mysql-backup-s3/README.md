# BNB Postgres Backup to S3

A Rancher catalog build of Johannes Schickling's [mysql-backup-s3](https://github.com/schickling/dockerfiles/tree/master/mysql-backup-s3) container.

Scheduling built in, but if you want to do a one-off backup, just shell into the container and run:

```
sh backup.sh
```
