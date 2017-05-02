chronyd:
  pkg.installed:
    - pkgs:
      - chrony
  file.managed:
    - name: /etc/chrony.conf
    - source: salt://openstack/Environment/files/chronyM.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      SOURCEIP: "172.25.6.250"
      ALLOWIP: "172.25.6.0/24"
  
  service.running:
    - name: chronyd
    - enable: True
    - restart: True

