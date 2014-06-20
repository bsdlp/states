base:
  '*':
    - base
    - ssh
    - users
  'G@role:aur_repo':
    - match: grain
    - aur_repo
  'G@role:coldfusion':
    - match: grain
    - base
    - coldfusion
  'G@role:docker':
    - match: grain
    - docker
  'G@role:irssi':
    - match: grain
    - irssi
  'G@role:master':
    - match: grain
    - salt.master
  'G@role:mesos':
    - match: grain
    - mesos
  'G@role:spigot':
    - match: grain
    - java
    - spigot
