base:
  '*':
    - base
    - iptables
    - ssh
    - users
  'G@role:aur_repo':
    - match: compound
    - aur_repo
  'G@role:buildbox':
    - match: compound
    - docker
  'G@role:coldfusion':
    - match: compound
    - coldfusion
  'G@role:csgo':
    - match: compound
    - csgo
  'G@role:docker':
    - match: compound
    - docker
  'G@role:irssi':
    - match: compound
    - irssi
  'G@role:killingfloor':
    - match: compound
    - steam
    - killingfloor
  'G@role:master':
    - match: compound
    - salt.master
  'G@role:mesos':
    - match: compound
    - mesos
  'G@role:scala':
    - match: compound
    - scala
  'G@role:spigot':
    - match: compound
    - java
    - spigot
