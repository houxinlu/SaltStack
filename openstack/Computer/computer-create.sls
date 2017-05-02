Computer-create:
  cmd.run:
    - name: |
         source /root/admin-openrc
         openstack user create --domain default --password nova nova
         openstack role add --project service --user nova admin
         openstack service create --name nova --description "OpenStack Compute" compute
         openstack endpoint create --region RegionOne   compute public http://172.25.6.1:8774/v2.1/%\(tenant_id\)s
         openstack endpoint create --region RegionOne   compute internal http://172.25.6.1:8774/v2.1/%\(tenant_id\)s
         openstack endpoint create --region RegionOne   compute admin http://172.25.6.1:8774/v2.1/%\(tenant_id\)s
         systemctl stop firewalld
         systemctl disable firewalld
