dotfiles
========

From their start standing on the shoulders of dotfile giants like sontek,
jtratner&#39;s dotfiles have begun to slowly evolve in their own right.
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======

Using these dotfiles
====================

## tl;dr

    git clone https://github.com/jtratner/dotfiles.git dotfiles
    cd dotfiles
    ./install.sh
    cd _vim
    ./symlinkdirectory bundle-available bundle

My setup is different than that of sontek and others, because I like to be able
to individually control bundles on each machine, so I use symlinks to each
directory. Plus, if you need to remove a bundle, you don't have to go through
the annoying hassle of removing it from your gitmodules first. But you should do
what works for you.

## Using the dotfiles

* Pathogen reads from `_vim/bundle`, so any bundles you want to use should be
  symlinked into there (you can use the `symlinkdirectory` script to do that)
* You need `rope`, `ack`, `nose` and `ipython` to use all of the features in the
  bundle.
* Run `install.sh` to set up the dotfiles. It auto backs up your existing
  dotfiles to .bak. (if you want to remove the new files, you can do so either
  by using `rm -i *` and only accepting symlinks or by using the `rm_symlink`
  function from my package [`simpleutils`][su] (vaguely shameless plug!)

## New commands, bundles and additional reading

The `_vimrc` file is pretty well documented too. You should also go read
[sontek's description of his dotfiles][SDot] for more in-depth info on many of
these plugins.  I'm just going to mention the changes I've made since
'forking'(ish) sontek's dotfiles.

[SDot]: http://sontek.net/turning-vim-into-a-modern-python-ide

### New bundles

<<<<<<< HEAD
<<<<<<< HEAD
1. _Additional Bundles_
** _vim-ipython_ - **hands down the best tool to help you code in python** lets
you connect to ipython, which is a fabulous suite for
** _tComment_ - handy for easily commenting/uncommenting sections
>>>>>>> 8b3c5c1... adding guide to README

<<<<<<< HEAD
Using these dotfiles
====================

## tl;dr

    git clone https://github.com/jtratner/dotfiles.git dotfiles
    cd dotfiles
    ./install.sh
    cd _vim
    ./symlinkdirectory bundle-available bundle

My setup is different than that of sontek and others, because I like to be able
to individually control bundles on each machine, so I use symlinks to each
directory. Plus, if you need to remove a bundle, you don't have to go through
the annoying hassle of removing it from your gitmodules first. But you should do
what works for you.

## Using the dotfiles

* Pathogen reads from `_vim/bundle`, so any bundles you want to use should be
  symlinked into there (you can use the `symlinkdirectory` script to do that)
* You need `rope`, `ack`, `nose` and `ipython` to use all of the features in the
  bundle.
* Run `install.sh` to set up the dotfiles. It auto backs up your existing
  dotfiles to .bak. (if you want to remove the new files, you can do so either
  by using `rm -i *` and only accepting symlinks or by using the `rm_symlink`
  function from my package [`simpleutils`][su] (vaguely shameless plug!)

## New commands, bundles and additional reading

The `_vimrc` file is pretty well documented too. You should also go read
[sontek's description of his dotfiles][SDot] for more in-depth info on many of
these plugins.  I'm just going to mention the changes I've made since
'forking'(ish) sontek's dotfiles.

[SDot]: http://sontek.net/turning-vim-into-a-modern-python-ide

### New bundles

<<<<<<< HEAD
<<<<<<< HEAD
1. _Additional Bundles_
** _vim-ipython_ - **hands down the best tool to help you code in python** lets
you connect to ipython, which is a fabulous suite for
** _tComment_ - handy for easily commenting/uncommenting sections
>>>>>>> 8b3c5c1... adding guide to README

<<<<<<< HEAD
Using these dotfiles
====================

## tl;dr

    git clone https://github.com/jtratner/dotfiles.git dotfiles
    cd dotfiles
    ./install.sh
    cd _vim
    ./symlinkdirectory bundle-available bundle

My setup is different than that of sontek and others, because I like to be able
to individually control bundles on each machine, so I use symlinks to each
directory. Plus, if you need to remove a bundle, you don't have to go through
the annoying hassle of removing it from your gitmodules first. But you should do
what works for you.

## Using the dotfiles

* Pathogen reads from `_vim/bundle`, so any bundles you want to use should be
  symlinked into there (you can use the `symlinkdirectory` script to do that)
* You need `rope`, `ack`, `nose` and `ipython` to use all of the features in the
  bundle.
* Run `install.sh` to set up the dotfiles. It auto backs up your existing
  dotfiles to .bak. (if you want to remove the new files, you can do so either
  by using `rm -i *` and only accepting symlinks or by using the `rm_symlink`
  function from my package [`simpleutils`][su] (vaguely shameless plug!)

## New commands, bundles and additional reading

The `_vimrc` file is pretty well documented too. You should also go read
[sontek's description of his dotfiles][SDot] for more in-depth info on many of
these plugins.  I'm just going to mention the changes I've made since
'forking'(ish) sontek's dotfiles.

[SDot]: http://sontek.net/turning-vim-into-a-modern-python-ide

### New bundles

=======
### New Bundles
>>>>>>> d6b8234... updated readme, created scripts folder
=======
>>>>>>> f0915be... updated readme, cosmetic changes to vimrc
=======
### New Bundles
>>>>>>> d6b8234... updated readme, created scripts folder
=======
>>>>>>> f0915be... updated readme, cosmetic changes to vimrc
* _vim-ipython_ - **hands down the best tool to help you code in python** lets
  you connect to ipython, which is a fabulous suite for
* _VOom_ - simple but very useful vim application. Creates a two-pane outline
  window that allows you to browse the structure of your files (or
  classes/functions in python ,etc). For example if you run `:Voom` on this
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  file, you'll see a neat directory tree that you can use to navigate the file.
  Also has a useful in-file grep.
* _tComment_ - handy for easily commenting/uncommenting sections
* _snipmate_ - (updated to garbas' new version + added the snippet repository)
* _Powerline_ - better vim status bar. NOTE: You have to install a patched font
  to use it. Luckily, there are some included in \_fonts that'll be installed
  automatically. Yay!

[su]: https://github.com/jtratner/simpleutils

### New commands

* _autolinebreaking for comments/plaintext_ (textwrapping and autolinebreak)
** `<leader>en`[^en]\(tw=80), `<leader>ec`[^ec]\(tw=72) `<leader>ed`[^ed]\(tw=0, no autowrap)
* _VOom on <C-F3>_ (and toggle `Voom` with `<F3>`)
* _:EqualLine_ put an equals line just as long as current line of text
  (from a great post on [Stack Overflow][SO])

[^en]: 'Edit Normal'
[^ec]: 'Edit Comment'
[^ed]: 'Edit Done'


Setting up dotfiles, vim and IPython
====================================

## Getting Vim

### Compiling Vim (Medium!)

0. Handling dependencies - there are a ton and, unfortunately, vim doesn't
   always tell you that you've managed to get all the ones you want. I used to
   have an install script[^1], but it really varies a ton by platform.
** _Ubuntu (and Linux generally)_ : there's a raft of libraries, but the most
important to grab are: `xorg-dev python-dev ruby ruby-dev` as well as a raft of
ncurses libraries. Easier way: `sudo apt-get build-dep vim-gnome` (if you're
using unity)
** _Mac_ : I think you can get MacVim which should have everything
** _Windows_ : The \_vim files will be helpful, but note that it has to be under
`vimfiles`, not `.vim`

1. The easiest way to setup vim _and be sure that you have the features you
   want_ is to grab the tarball from the vim homepage, and configure it with:[^2]

    ./configure --enable-pythoninterp --enable-rubyinterp --enable-gui --with-features=huge --prefix=$HOME/path/to/directory `

2. Go to your directory where you installed vim and check that you got the right
   version with:

   ./vim --version

3. If you did it correctly, you'll get a huge amount of input with `+` and `-`.
   Most important thing is to check that you had the following:
** `+python`
** `+ruby` (if you want Command-T)
** `+xterm-clipboard` (if on Linux w/ X11) or another `+clipboard` entry -- you
need this to be able to copy/paste from the clipboard.

## Using the dotfiles

### Option 1: Clone the dotfiles

0. Install git. (e.g. `sudo apt-get install git`)

1. Pick a directory, then clone these dotfiles with (it'll automatically add it
   to a folder called 'dotfiles' unless you specify a different folder after the
   clone e.g. `git clone https://github.com/jtratner/dotfiles.git
   mydotfilecollection/jtratner`):

    git clone https://github.com/jtratner/dotfiles.git

### Option 2: Fork the dotfiles yourself

0. Get an account on github, follow their instructions and come back after a
   bit. Fork the dotfiles yourself. (click on the fork button ;))

1. Initiate a git repository, then add your fork of dotfiles on github as a
   remote. Finally, download your files.

   mkdir dotfiles
   cd dotfiles
   git init
   git remote add origin git@github.com:_username_/_yourrepository_.git
   git pull origin master

### Install the dotfiles

2. Go into the dotfiles directory, run `./install.sh` in the command line. BOOM!
   You are halfway done.

### Symlink the bundle(s) you want to use

3. Change into the \_vim subfolder (`cd _vim`)

4. To activate all the bundles in a folder, you can run the `symlinkdirectory`
   script.[^5]

   ./symlinkdirectory bundle-available bundle

5. That script created symlinks in the bundle folder to all the plugins in
   bundle-available. To choose just the plugins you want, add or delete some or
   use `ln -s` to create new ones[^5]. Bundle-disabled and testing contain
   additional plugins that you might try out. Or add your own!

## Install rope, nose and ack (optional virtualenv)

0. Rope and nose you can get through `easy_install` or `pip` (I prefer pip)

    pip install rope nose

1. Ack you have to get as a package (e.g. `apt-get install ack` or through
   homebrew)

2. `virtualenv` - highly useful, you probably want it. (I list it last because
   the previous items need to be installed system-wide)

    pip install virtualenv virtualenvwrapper
    virtualenvwrapper.sh

### You have a working setup!

Now you should be able to just run your file and have everything work. Whee!

## IPython

### Installing IPython (+ dependencies)

_Preface_ This ought to work:

    easy_install ipython[zmq,qtconsole,notebook,test]

It never works for me. You _can_ install IPython with `pip`/`easy_install`, you
just have to get the dependencies first. Before you do, you might also check out
the [IPython website][IP] and its [guide to installation][IPinstall]

0. Getting python dependencies (you may already have some or all of these) Note
   that matplotlib, scipy, and numpy are only required if you want to run pylab;
   however I highly suggest that you get them because they are very useful and
   pretty darn cool:

    pip install nose tornado pygments pyzmq pexpect distribute matplotlib scipy numpy

1. _Getting Qt._ This can be more or less of an ordeal, depending on your system.
   Do yourself a favor: _try to find a precompiled binary first_ it will be far
   easier. Seriously. Otherwise, you'll probably need to get `SIP`, `PyQt` and
   `Qt` online. (TODO: write instructions for this. For now, Google search is
   your friend.)

2. _Install IPython_ Okay, actually this is pretty easy now! Yay!

    pip install ipython

3. _Check that it's working_ Run IPython's testing suite. Read the output to
   make sure you aren't missing any libraries.

    iptest

4. _If it fails_,
    1. It's okay. Happened to me too.
    2. Read the output of iptest, see if it gives any info. (google is your
       friend).
    3. Check that you have all the dependencies.
    4. Try uninstalling and reinstalling IPython.
    5. If it's not fixed by now, try Google, [Stack Overflow][SO] or the [IPython website][IP].

[IP]: http://www.ipython.org
[IPinstall]: http://ipython.org/ipython-doc/stable/install/install.html
[SO]: http://www.stackoverflow.com

[^1]: Email me if you'd like a copy
[^2]: The easiest way is to download and install a precompiled version. On
Ubuntu, `vim-gnome` has most of what you want.
[^3]: I set up a different home directory and then symlink it to my local bin,
that way I can still use the default system editor as needed (say if xwindows
crashes or something :P)
[^5]: You can also do this individually with `ln -s`. It's important to use the
actual paths to the file, or sometimes the links will mess up. For that reason,
I recommend that, instead of using relative paths, use full paths. E.g. in to
symlink a file in a subfolder of the \_vim directory: `ln -s $PWD/myfile ../bundle/`
[^4]: Here's the whole list:

    VIM - Vi IMproved 7.3 (2010 Aug 15, compiled Apr 19 2012 21:01:31)
    Compiled by root@openwater
    Huge version with GTK2 GUI.  Features included (+) or not (-):
    +arabic +autocmd +balloon_eval +browse ++builtin_terms +byte_offset +cindent
    +clientserver +clipboard +cmdline_compl +cmdline_hist +cmdline_info +comments
    +conceal +cryptv +cscope +cursorbind +cursorshape +dialog_con_gui +diff
    +digraphs +dnd -ebcdic +emacs_tags +eval +ex_extra +extra_search +farsi
    +file_in_path +find_in_path +float +folding -footer +fork() +gettext
    -hangul_input +iconv +insert_expand +jumplist +keymap +langmap +libcall
    +linebreak +lispindent +listcmds +localmap -lua +menu +mksession +modify_fname
    +mouse +mouseshape +mouse_dec +mouse_gpm -mouse_jsbterm +mouse_netterm
    -mouse_sysmouse +mouse_xterm +multi_byte +multi_lang -mzscheme +netbeans_intg
    -osfiletype +path_extra -perl +persistent_undo +postscript +printer +profile
    +python -python3 +quickfix +reltime +rightleft +ruby +scrollbind +signs
    +smartindent -sniff +startuptime +statusline -sun_workshop +syntax +tag_binary
    +tag_old_static -tag_any_white -tcl +terminfo +termresponse +textobjects +title
    +toolbar +user_commands +vertsplit +virtualedit +visual +visualextra +viminfo
    +vreplace +wildignore +wildmenu +windows +writebackup +X11 -xfontset +xim
    +xsmp_interact +xterm_clipboard -xterm_save
    system vimrc file: "$VIM/vimrc"
        user vimrc file: "$HOME/.vimrc"
        user exrc file: "$HOME/.exrc"
    system gvimrc file: "$VIM/gvimrc"
        user gvimrc file: "$HOME/.gvimrc"
        system menu file: "$VIMRUNTIME/menu.vim"
    fall-back for $VIM: "/home/jtratner/vimpyru/share/vim"
    Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib/i386-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12   -I/usr/local/include  -g -O2 -D_FORTIFY_SOURCE=1     -I/usr/lib/ruby/1.8/i686-linux -DRUBY_VERSION=18
    Linking: gcc   -L. -Wl,-Bsymbolic-functions -rdynamic -Wl,-export-dynamic  -L/usr/local/lib -o vim   -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -lXt -lncurses -lselinux  -lacl -lgpm -L/usr/lib/python2.7/config -lpython2.7 -lutil -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions   -lruby1.8 -lrt -lm
=======
Setup
=====
=======
  file, you'll see a neat directory tree that you can use to navigate.
=======
  file, you'll see a neat directory tree that you can use to navigate the file.
  Also has a useful in-file grep.
>>>>>>> f0915be... updated readme, cosmetic changes to vimrc
* _tComment_ - handy for easily commenting/uncommenting sections
* _snipmate_ - (updated to garbas' new version + added the snippet repository)
* _Powerline_ - better vim status bar. NOTE: You have to install a patched font
  to use it. Luckily, there are some included in \_fonts that'll be installed
  automatically. Yay!

[su]: https://github.com/jtratner/simpleutils

### New commands

* _autolinebreaking for comments/plaintext_ (textwrapping and autolinebreak)
** `<leader>en`[^en]\(tw=80), `<leader>ec`[^ec]\(tw=72) `<leader>ed`[^ed]\(tw=0, no autowrap)
* _VOom on <C-F3>_ (and toggle `Voom` with `<F3>`)
* _:EqualLine_ put an equals line just as long as current line of text
  (from a great post on [Stack Overflow][SO])

[^en]: 'Edit Normal'
[^ec]: 'Edit Comment'
[^ed]: 'Edit Done'


Setting up dotfiles, vim and IPython
====================================
>>>>>>> d6b8234... updated readme, created scripts folder

## Getting Vim

### Compiling Vim (Medium!)

0. Handling dependencies - there are a ton and, unfortunately, vim doesn't
   always tell you that you've managed to get all the ones you want. I used to
   have an install script[^1], but it really varies a ton by platform.
** _Ubuntu (and Linux generally)_ : there's a raft of libraries, but the most
important to grab are: `xorg-dev python-dev ruby ruby-dev` as well as a raft of
ncurses libraries. Easier way: `sudo apt-get build-dep vim-gnome` (if you're
using unity)
** _Mac_ : I think you can get MacVim which should have everything
** _Windows_ : The \_vim files will be helpful, but note that it has to be under
`vimfiles`, not `.vim`

1. The easiest way to setup vim _and be sure that you have the features you
   want_ is to grab the tarball from the vim homepage, and configure it with:[^2]

    ./configure --enable-pythoninterp --enable-rubyinterp --enable-gui --with-features=huge --prefix=$HOME/path/to/directory `

2. Go to your directory where you installed vim and check that you got the right
   version with:

   ./vim --version

3. If you did it correctly, you'll get a huge amount of input with `+` and `-`.
   Most important thing is to check that you had the following:
** `+python`
** `+ruby` (if you want Command-T)
** `+xterm-clipboard` (if on Linux w/ X11) or another `+clipboard` entry -- you
need this to be able to copy/paste from the clipboard.

## Using the dotfiles

### Option 1: Clone the dotfiles

0. Install git. (e.g. `sudo apt-get install git`)

1. Pick a directory, then clone these dotfiles with (it'll automatically add it
   to a folder called 'dotfiles' unless you specify a different folder after the
   clone e.g. `git clone https://github.com/jtratner/dotfiles.git
   mydotfilecollection/jtratner`):

    git clone https://github.com/jtratner/dotfiles.git

### Option 2: Fork the dotfiles yourself

0. Get an account on github, follow their instructions and come back after a
   bit. Fork the dotfiles yourself. (click on the fork button ;))

1. Initiate a git repository, then add your fork of dotfiles on github as a
   remote. Finally, download your files.

   mkdir dotfiles
   cd dotfiles
   git init
   git remote add origin git@github.com:_username_/_yourrepository_.git
   git pull origin master

### Install the dotfiles

2. Go into the dotfiles directory, run `./install.sh` in the command line. BOOM!
   You are halfway done.

### Symlink the bundle(s) you want to use

3. Change into the \_vim subfolder (`cd _vim`)

4. To activate all the bundles in a folder, you can run the `symlinkdirectory`
   script.[^5]

   ./symlinkdirectory bundle-available bundle

5. That script created symlinks in the bundle folder to all the plugins in
   bundle-available. To choose just the plugins you want, add or delete some or
   use `ln -s` to create new ones[^5]. Bundle-disabled and testing contain
   additional plugins that you might try out. Or add your own!

## Install rope, nose and ack (optional virtualenv)

0. Rope and nose you can get through `easy_install` or `pip` (I prefer pip)

    pip install rope nose

1. Ack you have to get as a package (e.g. `apt-get install ack` or through
   homebrew)

2. `virtualenv` - highly useful, you probably want it. (I list it last because
   the previous items need to be installed system-wide)

    pip install virtualenv virtualenvwrapper
    virtualenvwrapper.sh

### You have a working setup!

Now you should be able to just run your file and have everything work. Whee!

## IPython

### Installing IPython (+ dependencies)

_Preface_ This ought to work:

    easy_install ipython[zmq,qtconsole,notebook,test]

It never works for me. You _can_ install IPython with `pip`/`easy_install`, you
just have to get the dependencies first. Before you do, you might also check out
the [IPython website][IP] and its [guide to installation][IPinstall]

0. Getting python dependencies (you may already have some or all of these) Note
   that matplotlib, scipy, and numpy are only required if you want to run pylab;
   however I highly suggest that you get them because they are very useful and
   pretty darn cool:

    pip install nose tornado pygments pyzmq pexpect distribute matplotlib scipy numpy

1. _Getting Qt._ This can be more or less of an ordeal, depending on your system.
   Do yourself a favor: _try to find a precompiled binary first_ it will be far
   easier. Seriously. Otherwise, you'll probably need to get `SIP`, `PyQt` and
   `Qt` online. (TODO: write instructions for this. For now, Google search is
   your friend.)

2. _Install IPython_ Okay, actually this is pretty easy now! Yay!

    pip install ipython

3. _Check that it's working_ Run IPython's testing suite. Read the output to
   make sure you aren't missing any libraries.

    iptest

4. _If it fails_,
    1. It's okay. Happened to me too.
    2. Read the output of iptest, see if it gives any info. (google is your
       friend).
    3. Check that you have all the dependencies.
    4. Try uninstalling and reinstalling IPython.
    5. If it's not fixed by now, try Google, [Stack Overflow][SO] or the [IPython website][IP].

[IP]: http://www.ipython.org
[IPinstall]: http://ipython.org/ipython-doc/stable/install/install.html
[SO]: http://www.stackoverflow.com

[^1]: Email me if you'd like a copy
[^2]: The easiest way is to download and install a precompiled version. On
Ubuntu, `vim-gnome` has most of what you want.
[^3]: I set up a different home directory and then symlink it to my local bin,
that way I can still use the default system editor as needed (say if xwindows
crashes or something :P)
[^5]: You can also do this individually with `ln -s`. It's important to use the
actual paths to the file, or sometimes the links will mess up. For that reason,
I recommend that, instead of using relative paths, use full paths. E.g. in to
symlink a file in a subfolder of the \_vim directory: `ln -s $PWD/myfile ../bundle/`
[^4]: Here's the whole list:

<<<<<<< HEAD
[1]: there are a ton of dependencies for compiling vim, and they aren't well documented. I used to have an install script but frankly
>>>>>>> 27ba0f9... updating README.md
=======
    VIM - Vi IMproved 7.3 (2010 Aug 15, compiled Apr 19 2012 21:01:31)
    Compiled by root@openwater
    Huge version with GTK2 GUI.  Features included (+) or not (-):
    +arabic +autocmd +balloon_eval +browse ++builtin_terms +byte_offset +cindent
    +clientserver +clipboard +cmdline_compl +cmdline_hist +cmdline_info +comments
    +conceal +cryptv +cscope +cursorbind +cursorshape +dialog_con_gui +diff
    +digraphs +dnd -ebcdic +emacs_tags +eval +ex_extra +extra_search +farsi
    +file_in_path +find_in_path +float +folding -footer +fork() +gettext
    -hangul_input +iconv +insert_expand +jumplist +keymap +langmap +libcall
    +linebreak +lispindent +listcmds +localmap -lua +menu +mksession +modify_fname
    +mouse +mouseshape +mouse_dec +mouse_gpm -mouse_jsbterm +mouse_netterm
    -mouse_sysmouse +mouse_xterm +multi_byte +multi_lang -mzscheme +netbeans_intg
    -osfiletype +path_extra -perl +persistent_undo +postscript +printer +profile
    +python -python3 +quickfix +reltime +rightleft +ruby +scrollbind +signs
    +smartindent -sniff +startuptime +statusline -sun_workshop +syntax +tag_binary
    +tag_old_static -tag_any_white -tcl +terminfo +termresponse +textobjects +title
    +toolbar +user_commands +vertsplit +virtualedit +visual +visualextra +viminfo
    +vreplace +wildignore +wildmenu +windows +writebackup +X11 -xfontset +xim
    +xsmp_interact +xterm_clipboard -xterm_save
    system vimrc file: "$VIM/vimrc"
        user vimrc file: "$HOME/.vimrc"
        user exrc file: "$HOME/.exrc"
    system gvimrc file: "$VIM/gvimrc"
        user gvimrc file: "$HOME/.gvimrc"
        system menu file: "$VIMRUNTIME/menu.vim"
    fall-back for $VIM: "/home/jtratner/vimpyru/share/vim"
    Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib/i386-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12   -I/usr/local/include  -g -O2 -D_FORTIFY_SOURCE=1     -I/usr/lib/ruby/1.8/i686-linux -DRUBY_VERSION=18
    Linking: gcc   -L. -Wl,-Bsymbolic-functions -rdynamic -Wl,-export-dynamic  -L/usr/local/lib -o vim   -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -lXt -lncurses -lselinux  -lacl -lgpm -L/usr/lib/python2.7/config -lpython2.7 -lutil -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions   -lruby1.8 -lrt -lm
>>>>>>> 8b3c5c1... adding guide to README
=======
Setup
=====
=======
  file, you'll see a neat directory tree that you can use to navigate.
=======
  file, you'll see a neat directory tree that you can use to navigate the file.
  Also has a useful in-file grep.
>>>>>>> f0915be... updated readme, cosmetic changes to vimrc
* _tComment_ - handy for easily commenting/uncommenting sections
* _snipmate_ - (updated to garbas' new version + added the snippet repository)
* _Powerline_ - better vim status bar. NOTE: You have to install a patched font
  to use it. Luckily, there are some included in \_fonts that'll be installed
  automatically. Yay!

[su]: https://github.com/jtratner/simpleutils

### New commands

* _autolinebreaking for comments/plaintext_ (textwrapping and autolinebreak)
** `<leader>en`[^en]\(tw=80), `<leader>ec`[^ec]\(tw=72) `<leader>ed`[^ed]\(tw=0, no autowrap)
* _VOom on <C-F3>_ (and toggle `Voom` with `<F3>`)
* _:EqualLine_ put an equals line just as long as current line of text
  (from a great post on [Stack Overflow][SO])

[^en]: 'Edit Normal'
[^ec]: 'Edit Comment'
[^ed]: 'Edit Done'


Setting up dotfiles, vim and IPython
====================================
>>>>>>> d6b8234... updated readme, created scripts folder

## Getting Vim

### Compiling Vim (Medium!)

0. Handling dependencies - there are a ton and, unfortunately, vim doesn't
   always tell you that you've managed to get all the ones you want. I used to
   have an install script[^1], but it really varies a ton by platform.
** _Ubuntu (and Linux generally)_ : there's a raft of libraries, but the most
important to grab are: `xorg-dev python-dev ruby ruby-dev` as well as a raft of
ncurses libraries. Easier way: `sudo apt-get build-dep vim-gnome` (if you're
using unity)
** _Mac_ : I think you can get MacVim which should have everything
** _Windows_ : The \_vim files will be helpful, but note that it has to be under
`vimfiles`, not `.vim`

1. The easiest way to setup vim _and be sure that you have the features you
   want_ is to grab the tarball from the vim homepage, and configure it with:[^2]

    ./configure --enable-pythoninterp --enable-rubyinterp --enable-gui --with-features=huge --prefix=$HOME/path/to/directory `

2. Go to your directory where you installed vim and check that you got the right
   version with:

   ./vim --version

3. If you did it correctly, you'll get a huge amount of input with `+` and `-`.
   Most important thing is to check that you had the following:
** `+python`
** `+ruby` (if you want Command-T)
** `+xterm-clipboard` (if on Linux w/ X11) or another `+clipboard` entry -- you
need this to be able to copy/paste from the clipboard.

## Using the dotfiles

### Option 1: Clone the dotfiles

0. Install git. (e.g. `sudo apt-get install git`)

1. Pick a directory, then clone these dotfiles with (it'll automatically add it
   to a folder called 'dotfiles' unless you specify a different folder after the
   clone e.g. `git clone https://github.com/jtratner/dotfiles.git
   mydotfilecollection/jtratner`):

    git clone https://github.com/jtratner/dotfiles.git

### Option 2: Fork the dotfiles yourself

0. Get an account on github, follow their instructions and come back after a
   bit. Fork the dotfiles yourself. (click on the fork button ;))

1. Initiate a git repository, then add your fork of dotfiles on github as a
   remote. Finally, download your files.

   mkdir dotfiles
   cd dotfiles
   git init
   git remote add origin git@github.com:_username_/_yourrepository_.git
   git pull origin master

### Install the dotfiles

2. Go into the dotfiles directory, run `./install.sh` in the command line. BOOM!
   You are halfway done.

### Symlink the bundle(s) you want to use

3. Change into the \_vim subfolder (`cd _vim`)

4. To activate all the bundles in a folder, you can run the `symlinkdirectory`
   script.[^5]

   ./symlinkdirectory bundle-available bundle

5. That script created symlinks in the bundle folder to all the plugins in
   bundle-available. To choose just the plugins you want, add or delete some or
   use `ln -s` to create new ones[^5]. Bundle-disabled and testing contain
   additional plugins that you might try out. Or add your own!

## Install rope, nose and ack (optional virtualenv)

0. Rope and nose you can get through `easy_install` or `pip` (I prefer pip)

    pip install rope nose

1. Ack you have to get as a package (e.g. `apt-get install ack` or through
   homebrew)

2. `virtualenv` - highly useful, you probably want it. (I list it last because
   the previous items need to be installed system-wide)

    pip install virtualenv virtualenvwrapper
    virtualenvwrapper.sh

### You have a working setup!

Now you should be able to just run your file and have everything work. Whee!

## IPython

### Installing IPython (+ dependencies)

_Preface_ This ought to work:

    easy_install ipython[zmq,qtconsole,notebook,test]

It never works for me. You _can_ install IPython with `pip`/`easy_install`, you
just have to get the dependencies first. Before you do, you might also check out
the [IPython website][IP] and its [guide to installation][IPinstall]

0. Getting python dependencies (you may already have some or all of these) Note
   that matplotlib, scipy, and numpy are only required if you want to run pylab;
   however I highly suggest that you get them because they are very useful and
   pretty darn cool:

    pip install nose tornado pygments pyzmq pexpect distribute matplotlib scipy numpy

1. _Getting Qt._ This can be more or less of an ordeal, depending on your system.
   Do yourself a favor: _try to find a precompiled binary first_ it will be far
   easier. Seriously. Otherwise, you'll probably need to get `SIP`, `PyQt` and
   `Qt` online. (TODO: write instructions for this. For now, Google search is
   your friend.)

2. _Install IPython_ Okay, actually this is pretty easy now! Yay!

    pip install ipython

3. _Check that it's working_ Run IPython's testing suite. Read the output to
   make sure you aren't missing any libraries.

    iptest

4. _If it fails_,
    1. It's okay. Happened to me too.
    2. Read the output of iptest, see if it gives any info. (google is your
       friend).
    3. Check that you have all the dependencies.
    4. Try uninstalling and reinstalling IPython.
    5. If it's not fixed by now, try Google, [Stack Overflow][SO] or the [IPython website][IP].

[IP]: http://www.ipython.org
[IPinstall]: http://ipython.org/ipython-doc/stable/install/install.html
[SO]: http://www.stackoverflow.com

[^1]: Email me if you'd like a copy
[^2]: The easiest way is to download and install a precompiled version. On
Ubuntu, `vim-gnome` has most of what you want.
[^3]: I set up a different home directory and then symlink it to my local bin,
that way I can still use the default system editor as needed (say if xwindows
crashes or something :P)
[^5]: You can also do this individually with `ln -s`. It's important to use the
actual paths to the file, or sometimes the links will mess up. For that reason,
I recommend that, instead of using relative paths, use full paths. E.g. in to
symlink a file in a subfolder of the \_vim directory: `ln -s $PWD/myfile ../bundle/`
[^4]: Here's the whole list:

<<<<<<< HEAD
[1]: there are a ton of dependencies for compiling vim, and they aren't well documented. I used to have an install script but frankly
>>>>>>> 27ba0f9... updating README.md
=======
    VIM - Vi IMproved 7.3 (2010 Aug 15, compiled Apr 19 2012 21:01:31)
    Compiled by root@openwater
    Huge version with GTK2 GUI.  Features included (+) or not (-):
    +arabic +autocmd +balloon_eval +browse ++builtin_terms +byte_offset +cindent
    +clientserver +clipboard +cmdline_compl +cmdline_hist +cmdline_info +comments
    +conceal +cryptv +cscope +cursorbind +cursorshape +dialog_con_gui +diff
    +digraphs +dnd -ebcdic +emacs_tags +eval +ex_extra +extra_search +farsi
    +file_in_path +find_in_path +float +folding -footer +fork() +gettext
    -hangul_input +iconv +insert_expand +jumplist +keymap +langmap +libcall
    +linebreak +lispindent +listcmds +localmap -lua +menu +mksession +modify_fname
    +mouse +mouseshape +mouse_dec +mouse_gpm -mouse_jsbterm +mouse_netterm
    -mouse_sysmouse +mouse_xterm +multi_byte +multi_lang -mzscheme +netbeans_intg
    -osfiletype +path_extra -perl +persistent_undo +postscript +printer +profile
    +python -python3 +quickfix +reltime +rightleft +ruby +scrollbind +signs
    +smartindent -sniff +startuptime +statusline -sun_workshop +syntax +tag_binary
    +tag_old_static -tag_any_white -tcl +terminfo +termresponse +textobjects +title
    +toolbar +user_commands +vertsplit +virtualedit +visual +visualextra +viminfo
    +vreplace +wildignore +wildmenu +windows +writebackup +X11 -xfontset +xim
    +xsmp_interact +xterm_clipboard -xterm_save
    system vimrc file: "$VIM/vimrc"
        user vimrc file: "$HOME/.vimrc"
        user exrc file: "$HOME/.exrc"
    system gvimrc file: "$VIM/gvimrc"
        user gvimrc file: "$HOME/.gvimrc"
        system menu file: "$VIMRUNTIME/menu.vim"
    fall-back for $VIM: "/home/jtratner/vimpyru/share/vim"
    Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib/i386-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12   -I/usr/local/include  -g -O2 -D_FORTIFY_SOURCE=1     -I/usr/lib/ruby/1.8/i686-linux -DRUBY_VERSION=18
    Linking: gcc   -L. -Wl,-Bsymbolic-functions -rdynamic -Wl,-export-dynamic  -L/usr/local/lib -o vim   -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -lXt -lncurses -lselinux  -lacl -lgpm -L/usr/lib/python2.7/config -lpython2.7 -lutil -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions   -lruby1.8 -lrt -lm
>>>>>>> 8b3c5c1... adding guide to README
