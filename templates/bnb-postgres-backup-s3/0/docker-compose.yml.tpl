version: '2'
services:
  postgres-backup-s3:
    image: schickling/postgres-backup-s3
    stdin_open: true
    tty: true
    environment:
      SCHEDULE: ${schedule}
      S3_REGION: ${s3_region}
      S3_ACCESS_KEY_ID: ${s3_access_key_id}
      S3_SECRET_ACCESS_KEY: ${s3_secret_access_key}
      S3_BUCKET: ${s3_bucket}
      S3_PREFIX: ${s3_prefix}
      POSTGRES_DATABASE: ${postgres_database}
      POSTGRES_USER: ${postgres_user}
      POSTGRES_PASSWORD: ${postgres_password}
      POSTGRES_HOST: db
    external_links:
    - ${database_service}:db
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}