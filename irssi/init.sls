config:
  file.managed:
    - name: /home/irssi/.irssi/config
    - source: salt://irssi/files/irssi.config
    - user: irssi
    - makedirs: True

scripts:
  file.recurse:
    - source: salt://irssi/files/irssi.scripts
    - include_empty: True
    - makedirs: True
    - name: /home/irssi/.irssi/scripts
    - user: irssi

packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - irssi
      - oidentd
      - screen
