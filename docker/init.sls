docker:
  pkg:
    - installed
    - name: {{ pillar['pkgs']['docker'] }}
  service:
    - name: {{ pillar['services']['docker'] }}
    - enable: True
    - running
    - require:
      - file: /etc/systemd/system/docker.service

/etc/systemd/system/docker.service:
  file.managed:
    - source: salt://docker/files/docker.service
    - makedirs: True
