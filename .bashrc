# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# Enable history appending instead of overwriting.
shopt -s histappend >/dev/null 2>&1

# other shell options
shopt -s hostcomplete >/dev/null 2>&1
shopt -s no_empty_cmd_completion >/dev/null 2>&1

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	    color_prompt=yes
    else
    	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

clearprompt() {
  unset PROMPT_COMMAND
  export PS1='\[\033[1;34m\]\$\[\033[00m\] '
  clear
}

NO_COLOR="\[\033[00m\]"
LIGHT_WHITE="\[\033[1;37m\]"
WHITE="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
DARK_GRAY="\[\033[1;90m\]"
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
MAGENTA="\[\033[0;35m\]"
LIGHT_MAGENTA="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"

if [ -f ~/bin/git-prompt.sh ]; then
    . ~/bin/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWCOLORHINTS=true
    GIT_PS1_SHOWUPSTREAM="auto"

    PROMPT_COMMAND="__git_ps1"

    PROMPT_COMMAND+=" '${debian_chroot:+($debian_chroot)}"$YELLOW"\u"$DARK_GRAY"@"$YELLOW"\h:"$LIGHT_BLUE"\w"$NO_COLOR"'"

    PROMPT_COMMAND+=" '"$LIGHT_BLUE"\\$"$NO_COLOR" '"

    # git branch and status
    PROMPT_COMMAND+=" ' %s'"
fi

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

eval `dircolors ~/.dircolors`

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
[ -f /etc/bash_completion ] && . /etc/bash_completion

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

################################################################################
# programming environments

[ -d "$HOME/.pandoc/bin" ] && PATH="$HOME/.pandoc/bin:$PATH"

# enable perlbrew or local::lib (Perl development) if it exists
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
   . ~/perl5/perlbrew/etc/bashrc
elif [ -d ~/perl5/lib/perl5 ]; then
   eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
fi

# enable virtualenv (Python development) if it exists
[ -f ~/.virtualenvs ] && export WORKON_HOME=~/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && . /usr/local/bin/virtualenvwrapper.sh

# enable local Python if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# enable Pyenv, if it exists
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# ruby as local user
if which ruby >/dev/null && which gem >/dev/null; then
    GEM_HOME=$(ruby -e 'puts Gem.user_dir')
    PATH="$GEM_HOME/bin:$PATH"
fi

# go
if [ -d "$HOME/.go" ]; then
    export GOPATH="$HOME/.go"
    PATH=$PATH:$GOPATH/bin
fi

# Android SDK
if [ -d "$HOME/tools/android" ]; then
    ANDROID_HOME=$HOME/tools/android/sdk
    PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
fi

# heroku toolbelt
if [ -x /usr/local/heroku/bin/heroku ]; then
    PATH="/usr/local/heroku/bin:$PATH"
fi

# PHP composer global
if [ -x "$HOME/.composer/vendor/bin" ]; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# npm modules
# [ -d "$HOME/.npm/bin" ] && PATH="$HOME/.npm/bin:$PATH"

# node version manager
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Rust
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

################################################################################

# pandoc executables
[ -d "$HOME/.pandoc/bin" ] && PATH="$HOME/.pandoc/bin:$PATH"

# custom scripts
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.bin/bin" ] && PATH="$HOME/.bin/bin:$PATH"

export DEBEMAIL="jakob.voss@gbv.de"
export DEBFULLNAME="Jakob Voß"
