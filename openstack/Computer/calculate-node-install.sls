nodes-install:
  pkg.installed:
    - pkgs:
      - openstack-nova-compute.noarch
  file.managed:
    - name: /etc/nova/nova.conf 
    - source: salt://openstack/Computer/files/nova-nodes.conf
    - mode: 644
    - user: root
    - group: nova
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
      my_ip: "172.25.6.2"
  cmd.run:
    - name: systemctl stop firewalld && systemctl disable firewalld && systemctl enable libvirtd.service openstack-nova-compute.service && systemctl start libvirtd.service openstack-nova-compute.service
