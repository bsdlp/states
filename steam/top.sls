steam:
  user.present:
    - shell: /bin/bash
    - home: /srv/steam

steamcmd:
  archive:
    - extracted
    - name: /srv/steam/
    - source: http://media.steampowered.com/installer/steamcmd_linux.tar.gz
    - archive_format: tar

/srv/steam:
  file.directory:
    - user: steam
    - group: steam
    - recurse:
      - user
      - group
