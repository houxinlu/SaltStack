include:
  - keepalived install

keepalived-server:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt:///srv/salt/keepalived/files/keepalived.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    {% if grains['fqdn'] == 'server2.example.com' %}
    - ROUTEID: haproxy_ha
    - STATEID: MASTER
    - PRIORITYID: 150
    {% elif grains['fqdn'] == 'server3.example.com '%}
    - ROUTEID: haproxy_ha
    - STATEID: MASTER
    - PRIORITYID: 100
    {% endif %}
  service.running:
    - name: keepalived
    - enable: True
    - watch:
      - file: keepalived-server
