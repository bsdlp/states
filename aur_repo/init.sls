abs_pkgs:
  pkg.installed:
    - refresh: True
    - pkgs:
      {% for pkg in pillar['aur_repo']['abs_pkgs'] %}
      - {{ pkg }}
      {% endfor %}

{% for build_dir in pillar['aur_repo']['build_dirs'] %}
{{ build_dir }}:
  file.directory:
    - makedirs: True
{% endfor %}

/etc/makepkg.conf:
  file.managed:
    - source: salt://aur_repo/files/makepkg.conf

/etc/abs.conf:
  file.managed:
    - source: salt://aur_repo/files/abs.conf

/usr/bin/abs:
  cmd:
    - run
    - require: abs_pkgs
