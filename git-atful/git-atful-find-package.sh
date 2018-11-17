# scripts to find packages in a repo

function git-atful-make-package-list() {
    git ls-tree --name-only -r origin/21.2 | grep CMakeLists.txt\
        | sed 's@/CMakeLists.txt@@' | sort -f > ${1-.pkg_list}
}

function git-atful-add-package() {
    local SP=.git/info/sparse-checkout
    local FILE
    for FILE in ${@:1} ; do
        echo ${FILE%/}/ >> $SP
    done
    git checkout HEAD
}

function git-atful-remove-package() {
    local SP=.git/info/sparse-checkout
    local TMP=$(cat $SP | sort -u | egrep -v $1)
    if [[ ${TMP} == '' ]]; then
        echo "ERROR: can't remove last package" 1>&2
        return 1
    fi
    local FILE
    rm $SP
    for FILE in $TMP; do
        echo $FILE >> $SP
    done
    git checkout HEAD
}

# TODO: add tab complete for remove?

function _git-atful-add-package() {
    local pkg_list_dir=/tmp/${USER}/${PWD}
    mkdir -p $pkg_list_dir
    local pkg_list=${pkg_list_dir}/pkg_list
    if [[ ! -f $pkg_list ]]; then
        git-atful-make-package-list $pkg_list
    fi

    # first check for completion from the root up
    COMPREPLY=( $(compgen -W "$(cat $pkg_list)" -- $2 ) )
    if [[ ${#COMPREPLY[*]} != 0 ]]; then
        return 0
    fi

    # then check for a unique fgrep match
    COMPREPLY=( $(fgrep ${2} $pkg_list ) )
    if [[ ${#COMPREPLY[*]} == 1 ]]; then
        return 0
    fi

    # then check to see if any part of the package name matches note
    # that we can't include the full path because that will trigger a
    # completion to any stub that is shared among all matches.
    COMPREPLY=( $(fgrep ${2} $pkg_list | egrep -o "[^/]*$2.*") )
    return 0
}
complete -F _git-atful-add-package git-atful-add-package
