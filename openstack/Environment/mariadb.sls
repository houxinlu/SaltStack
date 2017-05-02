mariadb-install:
  pkg.installed:
    - pkgs:
      - mariadb 
      - mariadb-server
      - python2-PyMySQL 
  file.managed:
    - name: /etc/my.cnf.d/openstack.cnf
    - source: salt://openstack/Environment/files/openstack.cnf
    - mode: 755
  service.running:
    - name: mariadb
    - enable: True
    - reload: True
 
mysql:
  file.managed:
    - name: /root/add.sql
    - source: salt://openstack/Environment/files/add.sql
    - mode: 755
  cmd.run:
    - name: cd /root && mysql < add.sql    
