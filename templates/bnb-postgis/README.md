# BNB Postgis

The goal of this is to have a similar structure to the community build of [postgres](https://github.com/rancher/community-catalog/tree/master/templates/postgres), but with postgis.

## What is inside Postgis Stack?
* Postgis Database + sidekick with volume data
* Load Balancer

## Info 
* Easy setup with all needed data: `database_name`, `user`, `password`
* Load Balancer used to forward Postgres port for the external services.
