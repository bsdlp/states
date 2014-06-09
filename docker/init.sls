docker:
  pkg:
    - installed
    - name: {{ pillar['pkgs']['docker'] }}
  service:
    - name: {{ pillar['services']['docker'] }}
    - enable: True
    - running
