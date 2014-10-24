ewrv6:
  ipset.set_present:
    - set_type: bitmap:ip
    - range: {{ pillar['ipset']['ewrv6'] }}
    - comment: EWRv6 pool
    - family: ipv6
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: set
    - match-set: ewrv6
    - save: True
    - require:
      - ipset: ewrv6
