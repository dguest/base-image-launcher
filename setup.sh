# set up some bash tools

(
    cd ~
    ln -s **/ssh .ssh
    ln -s **/.gitconfig
)
cat <<EOF >> ~/.bashrc
. ~/release_setup.sh
. ~/**/git-fatlas/git-fatlas.sh
EOF
