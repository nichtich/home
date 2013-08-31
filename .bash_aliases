alias la='ls -la'
alias sudo='sudo '
alias ..='cd ..'

function alwaysmake() {
    while sleep 1 
    do
        TARGET="$@"
        LANG= make "$TARGET" | grep -v '^make: .\+ is up to date.'
        # TODO: print message if rebuild target 
    done
}
