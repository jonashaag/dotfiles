#!/bin/bash -eu
git submodule update --init --recursive

pushd .vim/bundle/sparkup
make vim-pathogen
popd

