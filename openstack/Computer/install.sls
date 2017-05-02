computer-install:
  pkg.installed:
    - pkgs:
      - openstack-nova-scheduler.noarch
      - openstack-nova-api
      - openstack-nova-conductor
      - openstack-nova-console
      - openstack-nova-novncproxy
  file.managed:
    - name: /etc/nova/nova.conf
    - source: salt://openstack/Computer/files/nova.conf
    - mode: 644
    - user: root
    - group: nova
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
  cmd.run:
    - name: |
       su -s /bin/sh -c "nova-manage api_db sync" nova
       su -s /bin/sh -c "nova-manage db sync" nova > /dev/null
       systemctl enable openstack-nova-api.service openstack-nova-consoleauth.service openstack-nova-scheduler.service  openstack-nova-conductor.service openstack-nova-novncproxy.service
       systemctl start openstack-nova-api.service openstack-nova-consoleauth.service openstack-nova-scheduler.service openstack-nova-conductor.service openstack-nova-novncproxy.service

