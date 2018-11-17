# set up some bash tools

(
    cd ~
    ln -s **/ssh .ssh
    ln -s **/.gitconfig
)
PATH+=:~/**/git-atful
cat <<EOF >> ~/.bashrc
. ~/release_setup.sh
. ~/**/git-atful/git-atful.sh
EOF
