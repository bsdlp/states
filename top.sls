base:
  'os_family:Arch':
    - match: grain
    - base
  'os_family:Debian':
    - match: grain
    - base
  'G@role:docker':
    - match: compound
    - docker
  'G@role:irssi':
    - match: compound
    - irssi
  'G@role:master':
    - match: compound
    - salt.master
  'G@role:spigot':
    - match: compound
    - java
    - spigot
