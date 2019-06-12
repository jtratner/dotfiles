#!/bin/bash
# I use pyenv by default because it's *way* easier to manage than homebrew and
# makes it much easier to juggle multiple versions of python without killing
# your whole install.
set -o nounset
set -e
set -x
brew install pyenv
pyenv install 3.6.4
pyenv install 3.7.2
# 😭 sigh...
pyenv install 2.7.12
pyenv global 3.6.4
