#!/bin/bash
set -o nounset
set -e
set -x
brew -h # || (echo "Installing homebrew" && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")
brew install jq `# pretty-print javascript` \
fx \
parallel \
gprof2dot \
the_silver_searcher `# ag` \
fzf `# fuzzy search` \
xsv \
neovim \
pyenv `# python environment installer` \
iterm2
$(brew --prefix)/opt/fzf/install

