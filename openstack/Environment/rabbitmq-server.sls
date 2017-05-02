rabbitmq-install:
  pkg.installed:
    - pkgs:
      - rabbitmq-server
  service.running:
    - name: rabbitmq-server
    - enable: True
    - start: True
  cmd.run:
    - name: rabbitmqctl add_user openstack openstack && rabbitmqctl set_permissions openstack ".*" ".*" ".*"
    - unless: rabbitmqctl list_user_permissions openstack
