version: '2'
services:
  nginx-ldap-auth-authentication-ui:
    image: brandnewbox/nginx-ldap-auth-authentication-ui:latest
    stdin_open: true
    tty: true
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}
  nginx-ldap-auth-daemon:
    image: brandnewbox/nginx-ldap-auth-daemon:latest
    stdin_open: true
    tty: true
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}  
  nginx-ldap-auth-reverse-proxy:
    image: brandnewbox/nginx-ldap-auth-reverse-proxy:latest
    stdin_open: true
    tty: true
    environment:
      SECURE_SERVICE_PORT: ${secure_service_port}
      LDAP_URL: ${ldap_url}
      LDAP_MANAGER_DN: ${ldap_manager_dn}
      LDAP_MANAGER_PASSWORD: ${ldap_manager_password}
      LDAP_USER_SEARCH_BASE_DN: ${ldap_user_search_base_dn}
    links:
      - nginx-ldap-auth-daemon:daemon
      - nginx-ldap-auth-authentication-ui:authentication_ui
    external_links:
      - ${secure_service}:secure_service
    labels:
      io.rancher.container.pull_image: always
      {{- if ne .Values.host_label ""}}
      io.rancher.scheduler.affinity:host_label: ${host_label}
      {{- end}}

