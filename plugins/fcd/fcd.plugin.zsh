#!/usr/bin/env zsh
# fcd allows you to fuzzy search for your projects and move directly into them
# This even works in hierarchical directory structures such as clientname/projectname

# Usage:
# fcd filtername searchdepth
# e.g. fcd oh-my-zsh 2 will look for any results 2 levels deep
# Default value for searchdepth is 1
# Running fcd without any arguments will show a list of all directories

# Customisation:
# You can configure the root dir for searching. By default this is set to $HOME/projects
# but you can override this yourself
# FCD_BASEDIR=$HOME/projects
# You can set fcd to search in multiple directories, e.g. projects and utils by adding them as an array
# FCD_BASEDIR=($HOME/projects $HOME/utils)
#
# Set up functions for your common usages. For example if you have websites configured in
# ~/projects/clientname/sites/projectname you can search by projectname using "site projectname"
# if you define the below function
# site() {
#    fcd "/sites/*${1}" 3
# }

# Set the default basedir to projects
[[ -z $FCD_BASEDIR ]] && FCD_BASEDIR=$HOME/projects

# Expects two parameters, the searchterm and the searchdepth. Searchdepth is 1 by default
fcd() {
    depth=1
    if (($+2)); then
        depth="${2}"
    fi
    DIRS=("${(@f)$(find ${FCD_BASEDIR} -mindepth $depth -maxdepth $depth -type d -path "*${1}*" ! -iname ".*")}")
    if (( ${#DIRS} == 1 )); then
        cd ${DIRS[1]}
    else
        echo "Multiple results found:"
        print -C 1 $DIRS
        cd ${DIRS[1]}
    fi
}