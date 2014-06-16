mesos_tarball:
  file.managed:
    - name: /tmp/0.19.0.tar.gz
    - source: https://www.apache.org/dist/mesos/0.19.0/mesos-0.19.0.tar.gz
    - source_hash: https://www.apache.org/dist/mesos/0.19.0/mesos-0.19.0.tar.gz.md5

required_packages:
  pkg.installed:
    pkgs:
      {% for pkg in pillar['mesos']['required_pkgs'] %}
      - {{ pkg }}
      {% endfor %}
