base:
  'os_family:Arch':
    - match: grain
    - base
  'os_family:Debian':
    - match: grain
    - base
  'roles:docker':
    - docker
  'roles:master':
    - salt.master
  'roles:spigot':
    - java
    - spigot
