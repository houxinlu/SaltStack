Glance-user:
  cmd.run:
    - name: |
         source /root/admin-openrc
         openstack user create --domain default --password glance glance
         openstack role add --project service --user glance admin
         openstack service create --name glance --description "OpenStack Image" image
         openstack endpoint create --region RegionOne   image public http://172.25.6.1:9292
         openstack endpoint create --region RegionOne   image internal http://172.25.6.1:9292
         openstack endpoint create --region RegionOne   image admin http://172.25.6.1:9292

        

