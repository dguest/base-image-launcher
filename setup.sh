# set up some bash tools

(
    cd ~
    ln -s **/ssh .ssh
    ln -s **/.gitconfig
)
cat <<EOF >> ~/.bashrc
. ~/release_setup.sh
. ~/**/dans-awesome-pack/setup.sh
EOF
