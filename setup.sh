#!/usr/bin/env bash

(
    cd ~
    ln -s **/ssh .ssh
    ln -s **/.gitconfig
)
. ~/release_setup.sh
