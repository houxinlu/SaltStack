include:
  - nginx.install

nginx-config:
  file.managed:
    - name: /usr/local/nginx/conf/nginx.conf
    - source: salt://nginx/files/nginx.conf

nginx-init:
  file.managed:
    - name: /etc/init.d/nginx
    - source: salt://nginx/files/nginx
    - mode: 755
  cmd.run:
    - name: chkconfig --add nginx
    - unless: chkconfig --list nginx
    - require:
      - file: nginx-init
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: nginx-config
