/srv/steam/kfinstall.txt:
  file.managed:
    - source: salt://killingfloor/files/steamscript.txt
    - user: steam
    - group: steam

install steamcmd:
  cmd.run:
    - name: /srv/steam/steamcmd.sh +runscript /srv/steam/kfinstall.txt
    - cwd: /srv/steam
    - user: steam
    - env:
      - STEAMEXE: 'steamcmd'
      - LD_LIBRARY_PATH: '/srv/steam/steamcmd/linux32/'

/srv/steam/kf/System/KillingFloor.ini:
  file.managed:
    - source: salt://killingfloor/files/KillingFloor.ini
    - user: steam
    - group: steam
    - template: jinja
