vim:
  pkg:
    - installed

zsh:
  pkg:
    - installed

mtr:
  pkg.installed:
    - name: {{ salt['pillar.get']['mtr'] }}

git:
  {% if grains['os_family'] == 'Debian' %}
  pkg.installed:
    - name: git
    - fromrepo: wheezy-backports
  {% else %}
  pkg:
    - installed
  {% endif %}

python2:
  pkg.installed:
    - name: {{ salt['pillar.get']['python2'] }}

stow:
  pkg:
    - installed
