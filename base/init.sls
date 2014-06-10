base-pkgs:
  pkg:
    - installed
    - pkgs:
      {% for package in pillar['base-pkgs'] %}
        - {{ package }}
      {% endfor %}

https://github.com/fly/dotfiles.git:
  git.latest:
    - target: /opt/dotfiles

/opt/dotfiles:
  git.submodule:
    - init

stow_dotfiles:
  cmd.run: 'cd /opt/dotfiles && make install'
