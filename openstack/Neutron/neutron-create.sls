Neutron-create:
  cmd.run:
    - name: |
         source /root/admin-openrc
         openstack user create --domain default --password neutorn neutron
         openstack role add --project service --user neutron admin
         openstack service create --name neutron   --description "OpenStack Networking" network
         openstack endpoint create --region RegionOne   network public http://172.25.6.1:9696
         openstack endpoint create --region RegionOne   network internal http://172.25.6.1:9696
         openstack endpoint create --region RegionOne   network admin http://172.25.6.1:9696
