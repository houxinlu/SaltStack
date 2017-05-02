base:
  'unit:nginx':
    - match: grain
    - nginx.service
  'server6.example.com':
    - httpd.apache
