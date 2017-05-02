include:
  - pkg.install

Keepalived-install:
  file.managed:
     - name:/mnt/keepalived-1.2.24.tar.gz
     - source:salt:///srv/salt/keepalived/files/keepalived-1.2.24.tar.gz
     - mode:755
     - user:root
     - group:root
  cmd.run:
     - name： cd /mnt/ && tar zxf keepalived-1.2.24.tar.gz && cd keepalived-1.2.24 && ./configure --prefix=/usr/local/keepalived && make && make install && ln -s /usr/local/keepalived/etc/rc.d/init.d/keepalived /etc/init.d/ && ln -s /usr/local/keepalived/etc/sysconfig/keepalived /etc/sysconfig/ && ln -s /usr/local/keepalived/etc/keepalived /etc/ && chmod +x /usr/local/keepalived/etc/rc.d/init.d/keepalived && ln -s /usr/local/keepalived/sbin/keepalived /sbin/
     - require:
       - file:keepalived-install

/etc/sysconfig/keepalived:
  file.managed:
    - source: salt:://keepalived/files/keepalived.sysconfig
    - mode: 644
    - user: root
    - group: root

/etc/init.d/keepalived:
  file.managed:
    - source: salt:://keepalived/files/keepalived.init
    - mode: 755
    - user: root
    - group: root

keepalived-init:
  cmd.run:
    - name: chkconfig --add keepalived
    - unless: chkconfig --list | grep keepalived
    - require:
      - file: /etc/init.d/keepalived

/etc/keepalived:
  file.directory:
    - user: root
    - group: root
