#!/bin/bash

CURR=$PWD

cd $HOME/.vim
./symlinkdirectory bundle-available bundle
./symlinkdirectory testing bundle
cd $PWD
