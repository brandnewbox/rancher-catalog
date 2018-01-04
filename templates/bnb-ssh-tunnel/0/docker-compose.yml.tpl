version: '2'
services:
  ssh-host-container:
    image: rancher/ssh-host-container
    stdin_open: true
    tty: true
    environment:
      SSH_KEY: ${ssh_key}
    ports:
      - ${tunnel_port}:22/tcp
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}