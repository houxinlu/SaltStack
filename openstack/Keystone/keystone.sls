keystone:
  pkg.installed:
    - pkgs:
      - openstack-keystone
      - httpd
      - mod_wsgi
  file.managed:
    - name: /etc/keystone/keystone.conf
    - source: salt://openstack/Keystone/files/keystone.conf
    - mode: 644
    - user: keystone
    - group: keystone
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
  cmd.run:
    - name: |
        keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone >/dev/null 
        chown keystone.keystone /var/log/keystone/keystone.log 
        su -s /bin/sh -c "keystone-manage db_sync"
