#!/usr/bin/env zsh
# fcd allows you to fuzzy search for your projects and move directly into them
# This even works in hierarchical directory structures such as clientname/projectname

# Usage:
# fcd filtername
# Running fcd without any arguments will show a list of all directories

# Customisation:
# You can configure the root dir for searching. By default this is set to $HOME/projects
# but you can override this yourself
# FCD_BASEDIR=$HOME/projects
# You can set fcd to search in multiple directories, e.g. projects and utils by adding them as an array
# FCD_BASEDIR=($HOME/projects $HOME/utils)
# More complex structures are possible too. For example if your projects are organized by client or even by client and project type
# FCD_BASEDIR=($HOME/projects/*/sites)

# Set the default basedir to projects
[[ -z $FCD_BASEDIR ]] && FCD_BASEDIR=$HOME/projects


_fcd_get_list() {
    DIRS=("${(@f)$(find ${FCD_BASEDIR} -mindepth 1 -maxdepth 1 -type d -path "*$1*" ! -iname ".*")}")
    print -C 1 $DIRS | awk '{gsub(/\/.*\//,"",$1); print}'
}

_fcd() {
   compadd `_fcd_get_list`
}

fcd() {
    DIRS=("${(@f)$(find ${FCD_BASEDIR} -mindepth 1 -maxdepth 1 -type d -path "*$1*" ! -iname ".*")}")
    if (( ${#DIRS} == 1 )); then
        cd ${DIRS[1]}
    else
        echo "Multiple results found:"
        print -C 1 $DIRS
        cd ${DIRS[1]}
    fi
}

compdef _fcd fcd