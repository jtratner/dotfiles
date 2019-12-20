#!/bin/bash
set -o nounset
set -e
set -x
brew -h || (echo "Installing homebrew" && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")
function install_if_missing () {
    brew list $1 &> /dev/null || brew install $1
}
# Javascript manipulation - important!
install_if_missing jq
install_if_missing fx
install_if_missing parallel
install_if_missing gprof2dot
# ag - etc
install_if_missing the_silver_searcher
install_if_missing fzf
install_if_missing xsv
/usr/local/opt/fzf/install

