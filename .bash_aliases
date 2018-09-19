shopt -s expand_aliases

# ...
alias sudo='sudo '
alias ..='cd ..'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias ll='ls -l --color=auto'
    alias la='ls -lai --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ll='ls -l'
    alias la='ls -la'
fi

# only install explicitly required modules
alias cpanmissing='cpanm --skip-satisfied --installdeps .'

# catmandu is too long to type
alias cm=catmandu

# create symlinks
symlink() {
    if [ -e "$1" ]; then ln -s "$1" "$2";
    elif [ -e "$2" ]; then ln -s "$2" "$1";
    else echo "symlink target not found!" 1>&2; (exit 1); fi
}

# handy perl evaluator
p() { 
    perl -E "say do { $* }"
}
