httpd-sevice:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://openstack/Keystone/files/httpd.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
  
httpd-VirtualHost:
  file.managed:
    - name: /etc/httpd/conf.d/wsgi-keystone.conf
    - source: salt://openstack/Keystone/files/wsgi-keystone.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
    
  service.running:
    - name: httpd
    - enable: True
    - restart: True


