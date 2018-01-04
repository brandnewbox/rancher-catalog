version: '2'
services:
  bnb-redis:
    image: rancher/ssh-host-container
    environment:
      SSH_KEY: ${ssh_key}
    ports:
      - "${tunnel_port}:22/tcp"
    {{- if ne .Values.host_label ""}}
    labels:
      io.rancher.scheduler.affinity:host_label: ${host_label}
    {{- end}}