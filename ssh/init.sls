/root/.ssh/authorized_keys:
  file.managed:
    - makedirs: True
    - template: jinja
    - source: salt://ssh/files/authorized_keys
