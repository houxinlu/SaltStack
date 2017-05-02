include:
  - pkg.install
  - user.nginx

nginx-source:
  file.managed:
    - name: /mnt/nginx-1.10.1.tar.gz
    - source: salt://nginx/files/nginx-1.10.1.tar.gz

nginx-install:
  cmd.run:
    - name: cd /mnt;tar zxf nginx-1.10.1.tar.gz;cd nginx-1.10.1;./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module --with-file-aio --with-threads &> /dev/null && make &> /dev/null && make install &> /dev/null
#    - unless: test -d /usr/local/nginx
    - creates : /usr/local/nginx
    - require:
      - pkg: pkg-install
      - file: nginx-source
      - user: nginx-user
