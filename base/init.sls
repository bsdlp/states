base-pkgs:
  pkg:
    - installed
    - pkgs:
      {% for package in pillar['base-pkgs'] %}
        - {{ package }}
      {% endfor %}
