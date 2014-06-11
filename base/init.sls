base-pkgs:
  pkg:
    - installed
    - pkgs:
      {% for package in pillar['base-pkgs'] %}
        - {{ package }}
      {% endfor %}

remove-nano:
  pkg.purged:
    - name: nano

dotfiles_transfer:
  file.recurse:
    - name: /root/
    - source: salt://base/files/dotfiles/dotfiles/
    - include_empty: True
