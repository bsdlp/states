pkgs:
  {% if grains['os_family'] == 'Debian' %}
  mtr: mtr-tiny
  {% else %}
  mtr: mtr
  {% endif %}
