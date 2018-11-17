#!/usr/bin/env bash

(
    cd ~
    ln -s **/ssh .ssh
    ln -s **/.gitconfig
)
PATH+=:~/git-atful
. ~/release_setup.sh
