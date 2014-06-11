base-pkgs:
  pkg:
    - installed
    - pkgs:
      {% for package in pillar['base-pkgs'] %}
        - {{ package }}
      {% endfor %}

dotfiles:
  file.recurse:
    - name: /opt/dotfiles
    - source: salt://base/files/dotfiles
    - include_empty: True
