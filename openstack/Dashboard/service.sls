dashboard-sever:
  pkg.installed:
    - pkgs:
      - openstack-dashboard
  file.managed:
    - name: /etc/openstack-dashboard/local_settings
    - source: salt://openstack/Dashboard/files/local_settings
    - mode: 640
    - user: root
    - group: apache
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
  cmd.run:
    - name: systemctl restart httpd.service memcached.service

