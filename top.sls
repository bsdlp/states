base:
  'os_family:Debian':
    - match: grain
    - base
  'os_family:Arch':
    - match: grain
    - base
  'roles:spigot':
    - java
    - spigot
  'roles:docker':
    - docker
