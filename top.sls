base:
  'os_family:Debian':
    - match: grain
    - base
  'os_family:Arch':
    - match: grain
    - base
  'minecraft':
    - java
    - spigot
  'docker':
    - docker
