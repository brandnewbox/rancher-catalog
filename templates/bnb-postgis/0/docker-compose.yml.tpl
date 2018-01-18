version: '2'
services:
  postgis-lb:
    image: rancher/lb-service-haproxy
    ports:
      - ${lb_port}
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}

  postgis-data:
    image: busybox
    volumes:
      - pgdata:/var/lib/postgresql/data/pgdata
    labels:
      io.rancher.container.start_once: true
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}

  postgis:
    image: kartoza/postgis:9.6-2.4
    environment:
      POSTGRES_DBNAME: ${postgres_dbname}
      POSTGRES_USER: ${postgres_user}
      POSTGRES_PASS: ${postgres_pass}
      ALLOW_IP_RANGE: ${allow_ip_range}
      HSTORE: ${hstore}
      TOPOLOGY: ${topology}
    tty: true
    stdin_open: true
    volumes_from:
      - postgis-data
    labels:
      io.rancher.sidekicks: postgis-data
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}

volumes:
  pgdata:
    driver: ${volume_driver}
    per_container: true