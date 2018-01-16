version: '2'
services:
  mysql-backup-s3:
    image: schickling/mysql-backup-s3
    stdin_open: true
    tty: true
    environment:
      SCHEDULE: ${schedule}
      S3_REGION: ${s3_region}
      S3_ACCESS_KEY_ID: ${s3_access_key_id}
      S3_SECRET_ACCESS_KEY: ${s3_secret_access_key}
      S3_BUCKET: ${s3_bucket}
      S3_PREFIX: ${s3_prefix}
      MYSQLDUMP_DATABASE: ${mysql_database}
      MYSQL_USER: ${mysql_user}
      MYSQL_PASSWORD: ${mysql_password}
      MYSQL_HOST: db
      MYSQL_PORT: ${mysql_port}
    external_links:
    - ${database_service}:db
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}