version: '2'
services:
  redis:
    image: redis:3.2-alpine
    stdin_open: true
    tty: true
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}