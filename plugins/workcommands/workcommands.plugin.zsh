site() {
    findandcd "/sites/*${1}" 3
}

serv() {
    findandcd "/servers/*${1}" 3
}

int() {
    findandcd "/internal/*${1}" 2
}

proj() {
    findandcd $1 1
}

findandcd() {
    DIRS=("${(@f)$(find ~/projects -mindepth ${2} -maxdepth ${2} -type d -path "*${1}*" ! -iname ".*")}")
    if (( ${#DIRS} == 1 )); then
        cd ${DIRS[1]}
    else
        echo "Multiple results found:"
        print -C 1 $DIRS
        cd ${DIRS[1]}
    fi
}