# set up some bash tools

# name of the local directory that we mount wihin the image so that
# some things are saved
PORTAL=portal

# set up the ssh and git config files
(
    cd ~
    ln -s ${PORTAL}/ssh .ssh
    if [[ ! -f ${PORTAL}/.gitconfig ]] ; then
        echo "making default gitconfig"
        cat << EOF > ${PORTAL}/.gitconfig
[user]
  name = Cerny McCernface
  email = cernface@cern.ch
[color]
  dif = auto
  status = auto
  branch = auto
  ui = always
EOF
        ln -s ${PORTAL}/.gitconfig
    fi
)

# set up some useful utilities
(
    PATH=${PATH}:${HOME}/${PORTAL}/bin
    if [[ ! -d ~/${PORTAL}/bin ]] ; then
        mkdir ~/${PORTAL}/bin
    fi
    cd ~/${PORTAL}/bin
    if ! type jq &> /dev/null ; then
        JQ_URL=https://github.com/stedolan/jq/releases/download/jq-1.6/
        JQ_VERS=jq-linux64
        echo "getting jq"
        wget ${JQ_URL}/${JQ_VERS}
        mv ${JQ_VERS} jq
        chmod +x jq
    fi
)


# set up something to remember the directory stack between sessions
touch .WORKING_DIRECTORY_STACK
cat <<EOF >> ~/.bashrc
. ~/release_setup.sh
. ~/${PORTAL}/dans-awesome-pack/setup.sh
HISTFILE=${HOME}/${PORTAL}/code/.history
HISTSIZE=""
HISTFILESIZE=""
PATH+=:${HOME}/${PORTAL}/bin
DIRECTORY_STACK_FILE=~/${PORTAL}/code/.WORKING_DIRECTORY_STACK
load-dir-stack
EOF
echo "here is ${PWD}"
echo save-dir-stack > ~/.bash_logout

