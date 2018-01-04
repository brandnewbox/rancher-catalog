version: '2'
services:
  nginx-cache:
    image: brandnewbox/nginx-cache
    environment:
      BACKEND_HOST: app
      BACKEND_PORT: ${backend_port}
    links:
    - ${backend_service}:app
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}