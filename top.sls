base:
  '*':
    - base
    - ssh
    - users
  'G@role:aur_repo':
    - match: compound
    - aur_repo
  'G@role:coldfusion':
    - match: compound
    - base
    - coldfusion
  'G@role:docker':
    - match: compound
    - docker
  'G@role:irssi':
    - match: compound
    - irssi
  'G@role:master':
    - match: compound
    - salt.master
  'G@role:mesos':
    - match: compound
    - mesos
  'G@role:spigot':
    - match: compound
    - java
    - spigot
