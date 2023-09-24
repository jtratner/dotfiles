========================
the dotfiles of jtratner
========================

From their start standing on the shoulders of dotfile giants like sontek,
jtratner's dotfiles have begun to slowly evolve in their own right.

.. contents:: What's In Here
    :depth: 2

Using these dotfiles
====================

Super-quick Install
-------------------

Get a working set of files by entering the following on a command line.

::

    git clone https://github.com/jtratner/dotfiles.git .dotfiles
    cd .dotfiles
    ./install.sh

Installing on Mac
-----------------

Install homebrew from https://brew.sh . Then edit ``~/.localrc`` to reference homebrew.

::

    ./homebrew/install_stuff.sh
    ./homebrew/install_media_ai.sh
    ./python/install_system_pythons.sh


Installation Notes
------------------

``install.sh``
""""""""""""""

(see tl;dr above) Running ``install.sh`` sets up the dotfiles and updates
submodules + will back up your files to .bak. If, for some reason, you don't
want to update your submodules, you can comment out the lines that start with
``git``

Some things need dependencies
"""""""""""""""""""""""""""""

I've tried to document dependencies below, but a quick list here for
reference. **NONE of these are necessary to use my dotfiles,** they just
enable additional features.

===========    ==============
Plugin         Dependencies
===========    ==============
Syntastic      Requires 'compilers' for whatever files you want to check (for example, to check ``.rst`` files you need docutils)
Ack            Requires an installation of ``ack`` (well worth it!)
===========    ==============

My dotvim
==========

The ``vimrc.symlink`` file is pretty well documented.  You could also go read
`sontek's description of his dotfiles`_ for more in-depth info on many of
these plugins.  I'm just going to mention the changes I've made since
'forking'(ish) sontek's dotfiles. More info will come over time

.. _sontek's description of his dotfiles: http://sontek.net/turning-vim-into-a-modern-python-ide

New bundles
-----------

* **syntastic** - makes it real easy to check the syntax on any filetype (just
  have to have the parser installed. I have ``docutils`` (rst), ``pyflakes``,
  ``pep8`` (for python) installed at the moment, to name a few).

* **VOom** - simple but very useful vim application. Creates a two-pane outline
  window that allows you to browse the structure of your files (or
  classes/functions in python ,etc). For example if you run ``:Voom`` on this
  file, you'll see a neat directory tree that you can use to navigate the file.
  Also has a useful in-file grep.

* **tComment** - handy for easily commenting/uncommenting sections

* **snipmate** - (updated to garbas' new version + added the snippet repository)

* **Powerline** - better vim status bar. NOTE: You have to install a patched
  font to use it. Luckily, there are some included in fonts/fonts.symlink/
  that'll be installed automatically. Yay!

* **Ctrl-P** - like ``Command-T`` but on steroids + no ruby required. Just
  type ``<ctrl-P>`` and your


reStructuredText/autounderline Functions
----------------------------------------

* ``:Underline <arg>`` and ``:Title <arg>`` where ``<arg>`` is a character or
  number. (title creates an under and overline)

::

    some vim text

    ":Un -

    some vim text
    -------------

New shortcuts
-------------

Mappings
""""""""

===========  ==============  =============================
Mapping      Mnemonic        Settings                    
===========  ==============  =============================
<leader> en  'edit normal'   tw=78; fo+=t, colorcolumn+=0
<leader> ec  'edit comment'  tw=72; fo+=t, colorcolumn+=0
<leader> ed  'edit done'     restore defaults 
                             (or tw=80,fo-=t, colorcolumn=0) 
<leader> p   'paste'         paste from clipboard
<leader> y   'yank'          yank to clipboard
<S-C-V>      (normal paste)  paste from clipboard
<S-C-C>      'copy'          yank to clipboard
Q            'quick form'?   format the current paragraph
===========  ==============  =============================

Commands
""""""""

===========  =============================
Command      Settings                    
===========  =============================
:SetFont     use to quickly change font in gvim
<F3>         toggle VoOM
:DiffSaved   Show diffs between current file and saved file
===========  =============================



====================================
Setting up dotfiles, vim and IPython
====================================

Getting Vim
===========


Prepacked
---------

Easiest way: ``sudo apt-get build-dep vim-gnome`` (if you're
using unity)

* **Mac** : You can download MacVim_ or use ``homebrew``
* **Windows** : The ``vim.symlink`` files will be helpful, but note that it has to be under
  ``vimfiles``, not ``.vim``

.. _MacVim : https://github.com/b4winckler/macvim

Getting the dotfiles
====================

Option 1: Clone the dotfiles
----------------------------

0. Install git. (e.g. ``sudo apt-get install git``)

1. Pick a directory, then clone these dotfiles with (it'll automatically add it
   to a folder called 'dotfiles' unless you specify a different folder after the
   clone e.g. ``git clone https://github.com/jtratner/dotfiles.git mydotfilecollection/jtratner``):


::

    git clone https://github.com/jtratner/dotfiles.git

Option 2: Fork the dotfiles yourself
------------------------------------

0. Get an account on github, follow their instructions and come back after a
   bit. Fork the dotfiles yourself. (click on the fork button ;))

1. Initiate a git repository, then add your fork of dotfiles on github as a
   remote. Finally, download your files.


::

    mkdir dotfiles
    cd dotfiles
    git init
    git remote add origin git@github.com:*username_/_yourrepository*.git
    git pull origin master

Install the dotfiles
====================

2. Go into the dotfiles directory, run ``./install.sh`` in the command line. BOOM!
   You are halfway done.

Python Dependencies
====================

Install rope, nose and ack (optional virtualenv)
------------------------------------------------

1. Rope and nose you can get through ``easy_install`` or ``pip`` (I prefer
   pip)

::

    pip install rope nose

2. Ack you have to get as a package (e.g. ``apt-get install ack`` or through
   homebrew)

3. ``virtualenv`` - highly useful, you probably want it. (I list it last because
   the previous items need to be installed system-wide)

::

    pip install virtualenv virtualenvwrapper
    virtualenvwrapper.sh
