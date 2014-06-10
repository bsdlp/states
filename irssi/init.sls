config:
  file.managed:
    - name: {{ pillar['users']['jchen']['home'] }}/.irssi/config
    - source: salt://irssi/files/irssi.config
    - user: jchen
    - makedirs: True

scripts:
  file.recurse:
    - source: salt://irssi/files/irssi.scripts
    - include_empty: True
    - makedirs: True
    - name: {{ pillar['users']['jchen']['home'] }}/.irssi/scripts

irssi:
  pkg:
    - installed
