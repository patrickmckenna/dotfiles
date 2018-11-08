# enable colorized terminal output
export CLICOLOR=1

# show current git branch in prompt
export PS1="\[\$(tput bold)\]\[\$(tput setaf 6)\]\w\[\$(tput setaf 3)\]\$(print-git-branch.sh)\[\$(tput setaf 6)\] > \[\$(tput sgr0)\]"

# general aliases
alias ll="ls -oAh"

export EDITOR=subl

# misc. stuff
export PATH="$PATH:$HOME/projects/bash_utils"

# Homebrew stuff
export PATH="$PATH:/usr/local/sbin"
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -a $(whoami) -w)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
export GLOBAL_BREWFILE="$HOME/.Brewfile"

# Hub uses this
export GITHUB_TOKEN=$(security find-generic-password -s HUB_TOKEN -a $(whoami) -w)

# Go stuff
export GOPATH="$HOME/projects/go_lang"
export PATH="$PATH:$GOPATH/bin"

# Python stuff
# enable pyenv shims and tab completion
if which pyenv >/dev/null; then
  eval "$(pyenv init -)"
fi

# enable tab completion for pipenv
if pipenv >/dev/null; then
    export PIPENV_VENV_IN_PROJECT=1
    eval "$(pipenv --completion)"
fi

export GLOBAL_PYTHON_PACKAGES="$HOME/.config/requirements.txt"

# load rbenv automatically
if which rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi

# add identities to ssh-agent
ssh-add -K "$HOME/.ssh/github_dotcom_id_rsa" >& /dev/null
