base:
  'os_family:Arch':
    - match: grain
    - base
    - users
  'os_family:Debian':
    - match: grain
    - base
    - users
  'roles:docker':
    - docker
  'roles:master':
    - salt.master
  'roles:spigot':
    - java
    - spigot
