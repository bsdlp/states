/root/.ssh/authorized_keys:
  file.managed:
    - makedirs: True
    - template: jinja
    - source: salt://ssh/files/authorized_keys

ssh:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/files/sshd_config
