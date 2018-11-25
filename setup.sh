# set up some bash tools

(
    cd ~
    ln -s **/ssh .ssh
    ln -s **/.gitconfig
)
touch .WORKING_DIRECTORY_STACK
cat <<EOF >> ~/.bashrc
. ~/release_setup.sh
. ~/**/dans-awesome-pack/setup.sh
DIRECTORY_STACK_FILE=~/**/.WORKING_DIRECTORY_STACK
EOF
echo "here is ${PWD}"
echo save-dir-stack > ~/.bash_logout
