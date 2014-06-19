site() {
    DIRS=("${(@f)$(find ~/projects -maxdepth 3 -mindepth 3 -type d -path '*/sites/*' ! -iname '.*')}")
    for dir in $DIRS
    do
        if [[ $dir =~ $1 ]]; then
            cd $dir
        fi
    done
}

serv() {
    DIRS=("${(@f)$(find ~/projects -maxdepth 3 -mindepth 3 -type d -path '*/servers/*' ! -iname '.*')}")
    for dir in $DIRS
    do
        if [[ $dir =~ $1 ]]; then
            cd $dir
        fi
    done
}

