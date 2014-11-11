mesos_tarball:
  archive.extracted:
    - name: /opt/
    - source: http://www.apache.org/dist/mesos/{{ pillar['mesos']['version'] }}/mesos-{{ pillar['mesos']['version'] }}.tar.gz
    - source_hash: http://www.apache.org/dist/mesos/{{ pillar['mesos']['version'] }}/mesos-{{ pillar['mesos']['version'] }}.tar.gz.md5
    - archive_format: tar
    - if_missing: /opt/mesos-{{ pillar['mesos']['version'] }}

required_packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      {% for pkg in pillar['mesos']['required_pkgs'] %}
      - {{ pkg }}
      {% endfor %}

/opt/buildscript.sh:
  cmd.script:
    - template: jinja
    - name: salt://mesos/buildscript.sh
    - cwd: /opt/mesos-{{ pillar['mesos']['version'] }}/
