memcached-install:
  pkg.installed:
    - pkgs:
      - memcached
      - python-memcached
  service.running:
    - name: memcached.service
    - enable: True
    - start: True
