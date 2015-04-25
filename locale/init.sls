# Installs and configures system locales

{% from "locale/map.jinja" import map with context %}

locale_pkgs:
  pkg.installed:
    - pkgs:
      {%- for pkg in map.pkgs %}
        - {{ pkg }}
      {% endfor %}

{%- set locales = salt['pillar.get']('locale:present', []) %}
{%- set default = salt['pillar.get']('locale:default', 'en_US.UTF-8') %}

{%- for locale in locales %}
locale_present_{{ locale|replace('.', '_')|replace(' ', '_') }}:
  locale.present:
    - name: {{ locale }}
{%- endfor %}

locale_default:
  locale.system:
    - name: {{ default }}
    - require:
      - locale: locale_present_{{ default|replace('.', '_')|replace(' ', '_') }}
