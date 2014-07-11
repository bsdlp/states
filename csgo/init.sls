dpkg_add_i386:
  cmd.run:
    - name: /usr/bin/dpkg --add-architecture i386:

csgo_pkgs:
  pkg.installed:
    - refresh: True
    - pkgs:
      {% for package in pillar['pkgs']['csgo'] %}
      - {{ package }}
      {% endfor %}
    - require:
      - cmd: dpkg_add_i386

steamcmd_install:
  cmd.run:
    - name: /srv/steam/bin/steamcmd.sh +login anonymous +force_install_dir /srv/steam/csgo +app_update 740 validate +quit
    - user: srcds
    - group: srcds
    - cwd: /srv/steam/
    - require:
      - cmd: dpkg_add_i386
      - pkg: csgo_pkgs
