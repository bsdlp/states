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

{% if grains['os_family'] == 'Debian' %}
  {% set shell = '/bin/zsh' %}
{% elif grains['os_family'] == 'Arch' %}
  {% set shell = '/usr/bin/zsh' %}
{% else %}
  {% set shell = '/usr/local/bin/zsh' %}
{% endif %}
root:
  user.present:
    - shell: {{ shell }}
