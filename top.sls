base:
  'os_family:Arch':
    - match: grain
    - base
    - users
  'os_family:Debian':
    - match: grain
    - base
    - users
  'G@role:docker':
    - match: grain
    - docker
  'G@role:irssi':
    - match: grain
    - irssi
  'G@role:master':
    - match: grain
    - salt.master
  'G@role:spigot':
    - match: grain
    - java
    - spigot
  'G@role:aur_repo':
    - match: grain
    - aur_repo
