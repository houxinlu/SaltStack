neutron-service:
  cmd.run:
    - name: |
       ln -s /etc/neutron/plugins/ml2/ml2_conf.ini /etc/neutron/plugin.ini
       su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head" neutron > /dev/null 
       systemctl restart openstack-nova-api.service
       systemctl enable neutron-server.service neutron-linuxbridge-agent.service neutron-dhcp-agent.service neutron-metadata-agent.service
       systemctl start neutron-server.service neutron-linuxbridge-agent.service neutron-dhcp-agent.service  neutron-metadata-agent.service
