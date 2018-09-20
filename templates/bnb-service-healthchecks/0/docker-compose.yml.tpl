version: '2'
services:
  service-healthchecks:
    image: brandnewbox/service-healthchecks:latest
    command: bundle exec ruby service-healthchecks.rb
    stdin_open: true
    tty: true
    environment:
      RACK_ENV: production
      POSTGRESQL_PORT: ${postgresql_port}
      POSTGRESQL_DATABASE: ${postgresql_database}
      POSTGRESQL_USERNAME: ${postgresql_username}
      POSTGRESQL_PASSWORD: ${postgresql_password}
      POSTGRESQL_DATABASE_HOST: postgresql_host
    external_links:
    - ${postgres_database_service}:postgresql_host
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}
