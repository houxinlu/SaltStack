mitaka:
  file.managed:
    - name: /etc/yum.repos.d/rhel-source.repo
    - source: salt://openstack/Environment/files/rhel-source.repo
    - mode: 644
    - user: root
    - group: root
