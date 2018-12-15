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
DIRECTORY_STACK_FILE=~/portal/code/.WORKING_DIRECTORY_STACK
load-dir-stack
EOF
echo "here is ${PWD}"
echo save-dir-stack > ~/.bash_logout

