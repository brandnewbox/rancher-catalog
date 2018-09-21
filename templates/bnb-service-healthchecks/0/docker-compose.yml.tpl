version: '2'
services:
  service-healthchecks:
    image: brandnewbox/service-healthchecks:latest
    command: bundle exec ruby service-healthchecks.rb
    stdin_open: true
    tty: true
    environment:
      RACK_ENV: production
      URL_NAMESPACE: ${url_namespace}
      POSTGRESQL_PORT: ${postgresql_port}
      POSTGRESQL_DATABASE: ${postgresql_database}
      POSTGRESQL_USERNAME: ${postgresql_username}
      POSTGRESQL_PASSWORD: ${postgresql_password}
      POSTGRESQL_HOST: postgresql_host
      MYSQL_PORT: ${mysql_port}
      MYSQL_DATABASE: ${mysql_database}
      MYSQL_USERNAME: ${mysql_username}
      MYSQL_PASSWORD: ${mysql_password}
      MYSQL_HOST: mysql_host
    external_links:
    - ${postgresql_database_service}:postgresql_host
    - ${mysql_database_service}:mysql_host
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}
