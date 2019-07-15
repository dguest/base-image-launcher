#!/usr/bin/env bash

# this should not be sourced
if [[ $- == *i* ]] ; then
    echo "Don't source me!" >&2
    return 1
else
    # set the shell to exit if there's an error (-e), and to error if
    # there's an unset variable (-u)
    set -eu
fi

_usage() {
   cat <<EOF
usage: ${0##*/} [release]

The "release" argument is required if not set already.
Must be: 'top' or 'base'
EOF
}

REL_FILE=RELEASE

if [[ $# == 1 ]] ; then
    TAG=21.2.82
    case $1 in
        top) RELEASE=analysistop:${TAG} ;;
        base) RELEASE=analysisbase:${TAG} ;;
        *) _usage; exit 1 ;;
    esac
    echo $RELEASE > $REL_FILE
elif [[ ! -f $REL_FILE ]]; then
    _usage
    exit 1
else
    RELEASE=$(cat $REL_FILE)
fi

docker run --rm -it \
       -v ${PWD}:/home/atlas/portal \
       -w /home/atlas/portal/code \
       atlas/${RELEASE} \
       bash -c "../setup.sh; bash --login"
