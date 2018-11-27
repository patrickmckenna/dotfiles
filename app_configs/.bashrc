# enable colorized terminal output
export CLICOLOR=1


# show current git branch in prompt
export PS1="\[\$(tput bold)\]\[\$(tput setaf 6)\]\w\[\$(tput setaf 3)\]\$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\[\$(tput setaf 6)\] > \[\$(tput sgr0)\]"


# general aliases
alias ll="ls -oAh"


if which subl >/dev/null; then
    export EDITOR=subl
fi


if [ -d "$HOME/bin" ]; then
    export PATH="$PATH:$HOME/bin"
fi


# Homebrew stuff
export PATH="$PATH:/usr/local/sbin"
HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -a $(whoami) -w 2>/dev/null)
if [ "$HOMEBREW_GITHUB_API_TOKEN" ]; then
    export HOMEBREW_GITHUB_API_TOKEN
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
if [ -f "$HOME/.Brewfile" ]; then
    export GLOBAL_BREWFILE="$HOME/.Brewfile"
fi


# Hub stuff (hub.github.com)
GITHUB_TOKEN=$(security find-generic-password -s GITHUB_TOKEN -a $(whoami) -w 2>/dev/null)
if [ "$GITHUB_TOKEN" ]; then
    export GITHUB_TOKEN
fi


# Python stuff
if which pyenv >/dev/null; then
    # enable pyenv shims and tab completion
    eval "$(pyenv init -)"
fi
if pipenv >/dev/null; then
    # enable tab completion for pipenv
    eval "$(pipenv --completion)"
    export PIPENV_VENV_IN_PROJECT=1
fi
if [ -f "$HOME/.config/requirements.txt" ]; then
    export GLOBAL_PYTHON_PACKAGES="$HOME/.config/requirements.txt"
fi


# Ruby stuff
if which rbenv >/dev/null; then
    # load rbenv automatically
    eval "$(rbenv init -)"
fi


# add identities to ssh-agent
if [ -f "$HOME/.ssh/id_rsa" ]; then
    ssh-add -K "$HOME/.ssh/id_rsa" >& /dev/null
fi
