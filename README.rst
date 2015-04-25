======
locale
======

Formula to install configure system locales.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``locale``
--------

Installs and configures system locales.

See locale/pillar.example.

Note
====

* Due to an unknown bug in the localemod execution module the first try to generate a locale on debian wheezy reports a fail but the locale is generated fine on the system. A second run reports no change. The system default locale is set in the second run.
* The default locale for an active user session will not be changed. Re-Login for it to be activated.
