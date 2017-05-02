nginx-group:
  group.present:
    - name: nginx
    - gid: 1000

nginx-user:
  user.present:
    - name: nginx
    - uid: 1000
    - gid: 1000
    - shell: /sbin/nologin
