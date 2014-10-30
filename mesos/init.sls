mesos_tarball:
  archive.extracted:
    - name: /opt/
    - source: http://www.apache.org/dist/mesos/0.20.0/mesos-0.20.0.tar.gz
    - source_hash: http://www.apache.org/dist/mesos/0.20.0/mesos-0.20.0.tar.gz.md5
    - archive_format: tar
    - if_missing: /opt/mesos-0.20.0

required_packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      {% for pkg in pillar['mesos']['required_pkgs'] %}
      - {{ pkg }}
      {% endfor %}
