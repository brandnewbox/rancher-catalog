version: '2'
services:
  bnb-redis:
    image: redis:3.2-alpine
    {{- if ne .Values.host_label ""}}
    labels:
      io.rancher.scheduler.affinity:host_label: ${host_label}
    {{- end}}