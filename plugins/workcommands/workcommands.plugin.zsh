site() {
    DIRS=("${(@f)$(find ~/projects -maxdepth 3 -mindepth 3 -type d -path "*/sites/*${1}*" ! -iname ".*")}")
    if (( ${#DIRS} == 1 )); then
        cd ${DIRS[1]}
    else
        echo 'Multiple sites found:'
        print -C 1 $DIRS
        cd ${DIRS[1]}
    fi
}

serv() {
    DIRS=("${(@f)$(find ~/projects -maxdepth 3 -mindepth 3 -type d -path "*/servers/*${1}*" ! -iname ".*")}")
    if (( ${#DIRS} == 1 )); then
        cd ${DIRS[1]}
    else
        echo 'Multiple servers found:'
        print -C 1 $DIRS
        cd ${DIRS[1]}
    fi
}

