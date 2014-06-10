base:
  'os_family:Debian':
    - match: grain
    - base
  'os_family:Arch':
    - match: grain
    - base
  'spigot*':
    - java
    - spigot
  'docker*':
    - docker
