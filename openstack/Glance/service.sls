Glance-api:
  pkg.installed:
    - pkgs:
      - openstack-glance
  file.managed:
    - name: /etc/glance/glance-api.conf
    - source: salt://openstack/Glance/files/glance-api.conf
    - user: root
    - group: glance
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
Glance-registry:
  file.managed:
    - name: /etc/glance/glance-registry.conf
    - source: salt://openstack/Glance/files/glance-registry.conf
    - user: root
    - group: glance
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
  cmd.run:
    - name: |
         su -s /bin/sh -c "glance-manage db_sync" glance > /dev/null
         systemctl enable openstack-glance-api.service openstack-glance-registry.service
         systemctl start openstack-glance-api.service openstack-glance-registry.service

Glance-image:
  file.managed:
    - name: /root/cirros-0.3.4-x86_64-disk.img
    - source: salt://openstack/Glance/images/cirros-0.3.4-x86_64-disk.img
    - user: root
    - group: root
  cmd.run:
    - name: |
         source /root/admin-openrc
         openstack image create "cirros" --file /root/cirros-0.3.4-x86_64-disk.img --disk-format qcow2 --container-format bare --public
         openstack image list
