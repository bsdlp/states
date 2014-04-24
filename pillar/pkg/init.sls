pkgs:
  {% if grains['os_family'] == 'Debian' %}
  mtr: mtr-tiny
  python2: python
  {% else %}
  mtr: mtr
  python2: python2
  {% endif %}
