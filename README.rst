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

Installing on Windows
---------------------

If you are using Windows, you can use the vim files by copying into your home
folder (where ``$HOME`` is your directory, where you have folders for My
Documents, etc). You can get my either via git clone or by downloading them as
a zip file on github.

* ``vimrc.symlink`` should be copied to ``$HOME/_vimrc`` (note the '_' !)
* ``vim.symlink`` should be copied to ``$HOME/vimfiles``


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
Hammer         Requires ``github/markup``, ``coderay``, and ``tilt``
Ack            Requires an installation of ``ack`` (well worth it!)
Vim-IPython    Requires ``ipython`` to be installed (see IPython section for more)
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

* **Hammer** ``:Hammer``, converts your current lightweight-markup file to
  HTML.

* **vim-ipython** - *hands down the best tool to help you code in python* lets
  you connect to ipython, which is a fabulous suite for

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

* **Mac** : I think you can get MacVim_ which should have everything
* **Windows** : The ``vim.symlink`` files will be helpful, but note that it has to be under
  ``vimfiles``, not ``.vim``

.. _MacVim : https://github.com/b4winckler/macvim

Compiling Vim (Medium!)
-----------------------

0. Handling dependencies - there are a ton and, unfortunately, vim doesn't
   always tell you that you've managed to get all the ones you want. I used to
   have an install script[1]_, but it really varies a ton by platform.

   * **Ubuntu (and Linux generally)**  there's a raft of libraries, but the most
     important to grab are: ``xorg-dev python-dev ruby ruby-dev`` as well as a
     raft of ncurses libraries.
   * **Mac**  Check out homebrew_

.. _homebrew : http://mxcl.github.com/homebrew/

1. The easiest way to setup vim and be sure that you have the features you want
   is to grab the tarball from the vim homepage, and configure it with[2]

::

    ./configure --enable-pythoninterp --enable-rubyinterp --enable-gui --with-features=huge --prefix=$HOME/path/to/directory `

2. Go to your directory where you installed vim and check that you got the right
   version with

::

    ./vim --version

3. If you did it correctly, you'll get a huge amount of input with ``+`` and ``-``.
   Most important thing is to check that you had the following:

   * ``+python``
   * ``+ruby`` (if you want Command-T)
   * ``+xterm-clipboard`` (if on Linux w/ X11) or another ``+clipboard`` entry
     -- you need this to be able to copy/paste from the clipboard.

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


IPython
=======

Installing IPython (+ dependencies)
-----------------------------------

*Preface* This ought to work:

::

    easy_install ipython[zmq,qtconsole,notebook,test]

It never works for me. You **can** install IPython with ``pip``/``easy_install``, you
just have to get the dependencies first. Before you do, you might also check out
the `IPython website`_ and its `guide to installation`_

0. Getting python dependencies (you may already have some or all of these) Note
    that matplotlib, scipy, and numpy are only required if you want to run pylab;
    however I highly suggest that you get them because they are very useful and
    pretty darn cool

::

    pip install nose tornado pygments pyzmq pexpect distribute matplotlib scipy numpy

1. **Getting Qt** This can be more or less of an ordeal, depending on your system.
    Do yourself a favor: *try to find a precompiled binary first* it will be far
    easier. Seriously. Otherwise, you'll probably need to get ``SIP``, ``PyQt`` and
    ``Qt`` online. (TODO: write instructions for this. For now, Google search is
    your friend.)

2. **Install IPython** Okay, actually this is pretty easy now! Yay!

::

    pip install ipython

3. *Check that it's working* Run IPython's testing suite. Read the output to
    make sure you aren't missing any libraries.

::

    iptest

4. **If it fails,**

    1. It's okay. Happened to me too.
    2. Read the output of iptest, see if it gives any info. (google is your
        friend).
    3. Check that you have all the dependencies.
    4. Try uninstalling and reinstalling IPython.
    5. If it's not fixed by now, try Google, `Stack Overflow`_ or the `IPython website`_

.. _IPython website: http://www.ipython.org
.. _guide to installation: http://ipython.org/ipython-doc/stable/install/install.html
.. _Stack Overflow: http://www.stackoverflow.com


You have a working setup!
-------------------------

Now you should be able to just run your file and have everything work. Whee!


.. [2] The easiest way is to download and install a precompiled version. On Ubuntu, ``vim-gnome`` has most of what you want.
.. [3] I set up a different home directory and then symlink it to my local bin,
       that way I can still use the default system editor as needed (say if xwindows
