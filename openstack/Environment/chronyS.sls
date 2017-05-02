chronyd:
  pkg.installed:
    - pkgs:
      - chrony
  file.managed:
    - name: /etc/chrony.conf
    - source: salt://openstack/Environment/files/chronyS.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      SOURCEIP: "172.25.6.1"
  
  service.running:
    - name: chronyd
    - enable: True
    - restart: True

