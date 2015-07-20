shopt -s expand_aliases

# ...
alias sudo='sudo '
alias ..='cd ..'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias la='ls -lai --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias la='ls -la'
fi

# only install explicitly required modules
alias cpanmissing='cpanm --skip-satisfied --installdeps .'
