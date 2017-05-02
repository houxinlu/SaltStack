httpd:
  pkg.installed:
    - pkgs:
      - httpd 
      - httpd-tools
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://httpd/files/httpd.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      PORT: "80"

  service.running:
    - name: httpd
    - enable: True
    - reload: True
    - watch:
      - file: /etc/httpd/conf/httpd.conf
