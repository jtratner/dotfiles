====================================
Debian/Ubuntu-specific install notes
====================================

.. contents::

Set your vim as default editor
==============================

Debian uses ``update-alternatives`` to to set the default editor. We want to use
*our* version of vim, so we need to change this. It's pretty easy, once you know
what to do. (more in-depth info about `installing update-alternatives`_) Here's
the command:

.. code:: bash

    sudo update-alternatives --install /usr/bin/editor editor /path/to/your/bin/vim 100
    # check that we added it appropriately (just press enter to accept)
    sudo update-alternatives --config editor

    #if you wanted to uninstall this (as opposed to changing the alternative
    sudo update-alternatives --remove editor /path/to/your/bin/vim

``update-alternatives`` is smart, so it also adds all the other executables
(gvim, vim, vimdiff, etc) to appropriate ``update-alternatives`` at the same
time. To briefly explain, here's what each part of the command does:

===========================================================================
Setting ``update-alternatives``
---------------------------------------------------------------------------

===========================      ===========================================
Command                          Meaning
===========================      ===========================================
``sudo update-alternatives``     use the debian update-alternatives system
``--install /usr/bin/editor``    install a new alternative for /usr/bin/editor
``editor``                       under the group name editor (I have no idea why
                                 this should be repeated like this)
``/path/to/your/bin/vim``        symlink this path as the alternative
``100``                          use this priority (for example, the default
                                 ``nano`` has priority ``50``) Plus, this will
                                 actually autoselect vim, which is nice.

``update-alternatives --config`` choose an alternative for
``editor``                       for ``editor``
============================================================================

.. _installing update-alternatives: http://www.debian.org/doc/manuals/debian-faq/ch-customizing.en.html

Installing dependencies
=======================

Vim plugins
-----------

Ack
"""
To get ack-grep and set it to install to ``ack`` (necessary for using Ack):

.. code:: bash

    sudo apt-get install ack-grep
    sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

IPython
-------

TODO: fill this in!
