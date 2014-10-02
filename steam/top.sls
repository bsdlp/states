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

configure steamcmd:
  cmd.run:
    - name: /srv/steam/steamcmd.sh +login anonymous
    - cwd: /srv/steam
    - user: steam
    - env:
      - STEAMEXE: 'steamcmd'
      - LD_LIBRARY_PATH: '/srv/steam/steamcmd/linux32/'
