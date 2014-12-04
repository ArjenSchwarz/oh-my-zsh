site() {
    fcd "/sites/*${1}" 3
}

serv() {
    fcd "/servers/*${1}" 3
}

int() {
    fcd "/internal/*${1}" 2
}

# Expects two parameters, the searchterm and the searchdepth. Searchdepth is 1 by default
fcd() {
    depth=1
    if (($+2)); then
        depth="${2}"
    fi
    DIRS=("${(@f)$(find ~/projects -mindepth ${depth} -maxdepth ${depth} -type d -path "*${1}*" ! -iname ".*")}")
    if (( ${#DIRS} == 1 )); then
        cd ${DIRS[1]}
    else
        echo "Multiple results found:"
        print -C 1 $DIRS
        cd ${DIRS[1]}
    fi
}