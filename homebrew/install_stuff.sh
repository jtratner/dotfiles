#!/bin/bash
set -o nounset
set -e
set -x
brew -h || (echo "Installing homebrew" && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")
# Javascript manipulation - important!
brew install jq
brew install fx
brew install parallel
brew install gprof2dot
# ag - etc
brew install the_silver_searcher

