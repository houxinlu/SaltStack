OpenStack-Identity:
  cmd.run:
    - name: |
         export OS_TOKEN=3e4ce56be45736404e67 
         export OS_URL=http://172.25.6.1:35357/v3 
         export OS_IDENTITY_API_VERSION=3 
         openstack service create --name keystone --description "OpenStack Identity" identity 
         openstack endpoint create --region RegionOne identity public http://172.25.6.1:5000/v3
         openstack endpoint create --region RegionOne identity internal http://172.25.6.1:5000/v3 
         openstack endpoint create --region RegionOne identity admin http://172.25.6.1:35357/v3
         openstack domain create --description "Default Domain" default
         openstack project create --domain default --description "Admin Project" admin
         openstack user create --domain default --password admin admin
         openstack role create admin
         openstack role add --project admin --user admin admin
         openstack project create --domain default --description "Service Project" service
         openstack project create --domain default --description "Demo Project" demo
         openstack user create --domain default --password demo demo
         openstack role create user
         openstack role add --project demo --user demo user
         unset OS_TOKEN OS_URL
         openstack --os-auth-url http://172.25.6.1:35357/v3 --os-project-domain-name default --os-user-domain-name default --os-project-name admin --os-username admin token issue --os-password admin
         openstack --os-auth-url http://172.25.6.1:5000/v3 --os-project-domain-name default --os-user-domain-name default --os-project-name demo --os-username demo token issue --os-password demo
  file.managed:
    - name: /root/admin-openrc
    - source: salt://openstack/Keystone/files/admin-openrc
    - mode: 644
    - user: root 
    - group: root
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
create-admin:
  file.managed:
    - name: /root/demo-openrc
    - source: salt://openstack/Keystone/files/demo-openrc
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
  cmd.run:
    - name: |
         source /root/admin-openrc
         openstack token issue

