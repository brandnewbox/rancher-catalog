# BNB Logspout
This template installs Logspout, a Docker container that vacuums up logs from all of the docker containers on the host and sends them off to a waiting Logstash instance.  By default it will gather all of the logs unless an environment variable is set on a service `LOGSPOUT=ignore`.

This may not be immediately suitable for multi-host deployments, it might require scheduling rules to run on each host, etc.

## Justification
The default Rancher catalog entry for Logspout won't gather from containers started with -t or -tty.  Rancher starts containers by default with -it (i for interactive, t for tty).
