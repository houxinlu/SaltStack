pub-net:
  pkg.installed:
    - pkgs:
      - openstack-neutron
      - openstack-neutron-ml2
      - openstack-neutron-linuxbridge
      - ebtables
  file.managed:
    - name: /etc/neutron/neutron.conf
    - source: salt://openstack/Neutron/files/neutron.conf
    - user: root
    - group: neutron
    - mode: 640
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
ml2:
  file.managed:
    - name: /etc/neutron/plugins/ml2/ml2_conf.ini
    - source: salt://openstack/Neutron/files/ml2_conf.ini
    - user: root
    - group: neutron
    - mode: 640

linuxbridge:
  file.managed:
    - name: /etc/neutron/plugins/ml2/linuxbridge_agent.ini
    - source: salt://openstack/Neutron/files/linuxbridge_agent.ini
    - user: root
    - group: neutron
    - mode: 640

dhcp:
  file.managed:
    - name: /etc/neutron/dhcp_agent.ini
    - source: salt://openstack/Neutron/files/dhcp_agent.ini
    - user: root
    - group: neutron 
    - mode: 640
metadata:
  file.managed:
    - name: /etc/neutron/metadata_agent.ini
    - source: salt://openstack/Neutron/files/metadata_agent.ini
    - user: root
    - group: neutron
    - mode: 640
    - template: jinja
    - defaults:
      controller: "172.25.6.1"

Nova:
  file.managed:
    - name: /etc/nova/nova.conf
    - source: salt://openstack/Neutron/files/nova.conf
    - user: root
    - group: nova
    - mode: 640
    - template: jinja
    - defaults:
      controller: "172.25.6.1"
      my_ip: "172.25.6.2"
