l2tp:
  pkg:
    - installed
    - refresh: True
    - pkgs:
      - openswan
      - xl2tpd
      - iptables-persistent
