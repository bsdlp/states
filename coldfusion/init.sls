cfinstallfile:
  file.managed:
    - source: salt://coldfusion/files/ColdFusion_11_WWEJ_linux64.bin
    - name: /srv/ColdFusion_11_WWEJ_linux64.bin

cfinstall:
  cmd.run:
    - name: /srv/assets/ColdFusion_11_WWEJ_linux64.bin -i silent -f installvariables.properties
    - creates: /opt/coldfusion11/
    - require:
      - file: cfinstallfile
