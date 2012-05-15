=======
dotvim
=======

Set up and use the dotfiles
===========================

Download my dotfiles and run the install script. (make sure you have git too!)::

    git clone https://github.com/jtratner/dotvim.git dotvim
    cd dotvim
    ./install.sh

And that's it!

Take whatever you like
=======================

The reason I reformatted everything is both to make my own life easier and to
make it easier for others to lift useful functions or mappings from my code. At
the moment, I've written a few short formatting functions that might be of
interest, particularly if you use lightweight markup.

If you end up finding something here useful, I'd love to `hear about it`_

NOTE: this is also included in my dotfiles, but I separated it out so that
people can just grab this and use it for their vim setup without needing to
deal with all of my dotfiles. (It also doesn't use the bundle/bundle-available
setup).

.. _hear about it : mailto:jeffrey.tratner+dotvim@gmail.com

Function/mapping highlights
===========================

Easy structured markup
-----------------------

Single and Double Underlining
"""""""""""""""""""""""""""""

===================     =============================================================
Function                 Description/Notes
===================     =============================================================
``:Underline(...)``     creates an underline for any given character
                        or accepts a precedence list of characters that can then be
                        called with '1','2','3','4'
``:Title(...)``         creates a double underline, e.g.
                        ``----------------``
                        `` Double Line Me!``
                        ``----------------``
====================    ================================================================

Auto-linebreaking,textwidth+colorcolumn on the fly
""""""""""""""""""""""""""""""""""""""""""""""""""

==================   =============================================================
``:SetFormat(tw)``   given a textwidth, sets textwidth and colorcolumn to a given #
                     characters
==================   =============================================================

===========  ==============  =============================
Mapping      Mnemonic        Settings                    
===========  ==============  =============================
<leader> en  'edit normal'   tw=78; fo+=t, colorcolumn+=0
<leader> ec  'edit comment'  tw=72; fo+=t, colorcolumn+=0
<leader> ed  'edit done'     restore defaults           
===========  ==============  =============================

