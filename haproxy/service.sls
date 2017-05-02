include:
  - haproxy.install

haproxy-config:
  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://haproxy/files/haproxy.cfg

haproxy-init:
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - watch:
      - file: haproxy-config
