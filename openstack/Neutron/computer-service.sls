nodes-install:
  pkg.installed:
    - pkgs:
      - openstack-neutron-linuxbridge
      - ebtables
      - ipset 
Neutron:
  file.managed:
    - name: /etc/neutron/neutron.conf
    - source: salt://openstack/Neutron/files-node/neutron.conf
    - mode: 640
    - user: root
    - group: neutron
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
Linuxbridge:
  file.managed:
    - name: /etc/neutron/plugins/ml2/linuxbridge_agent.ini
    - source: salt://openstack/Neutron/files-node/linuxbridge_agent.ini
    - mode: 640
    - user: root
    - group: neutron
Nova:
  file.managed:
    - name: /etc/nova/nova.conf
    - source: salt://openstack/Neutron/files-node/nova.conf
    - mode: 640
    - user: root
    - group: nova
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
      my_ip: "172.25.6.2"
Sevice:
  cmd.run:
    - name: systemctl restart openstack-nova-compute.service && systemctl enable neutron-linuxbridge-agent.service && systemctl start neutron-linuxbridge-agent.service  
 

