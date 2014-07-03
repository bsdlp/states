steamcmd_install:
  cmd.run:
    - name: /srv/steam/bin/steamcmd.sh +login anonymous +force_install_dir /srv/steam/csgo +app_update 740 validate +quit
    - user: srcds
    - group: srcds
    - cwd: /srv/steam/
