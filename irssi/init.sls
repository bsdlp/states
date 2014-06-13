config:
  file.managed:
    - name: /home/jchen/.irssi/config
    - source: salt://irssi/files/irssi.config
    - user: jchen
    - makedirs: True

scripts:
  file.recurse:
    - source: salt://irssi/files/irssi.scripts
    - include_empty: True
    - makedirs: True
    - name: /home/jchen/.irssi/scripts
    - user: jchen

packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - irssi
      - oidentd
      - screen
