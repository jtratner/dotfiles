#!/bin/bash
# I use pyenv by default because it's *way* easier to manage than homebrew and
# makes it much easier to juggle multiple versions of python without killing
# your whole install.
set -o nounset
set -e
set -x
pyenv install 3.11.1
