# enable colorized terminal output
export CLICOLOR=1

# show current git branch in prompt
export PS1="\[\$(tput bold)\]\[\$(tput setaf 6)\]\w\[\$(tput setaf 3)\]\$(print-git-branch.sh)\[\$(tput setaf 6)\] > \[\$(tput sgr0)\]"

# general aliases
alias ll="ls -oAh"

export EDITOR=subl

# my scripts
PERSONAL_UTILS="$HOME/projects/bash_utils"
if [ -d $PERSONAL_UTILS ]; then
    export PERSONAL_UTILS
    export PATH="$PATH:$PERSONAL_UTILS"
fi

# Homebrew stuff
export PATH="$PATH:/usr/local/sbin"
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -a $(whoami) -w)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Hub uses this
export GITHUB_TOKEN=$(security find-generic-password -s HUB_TOKEN -a $(whoami) -w)

# Go stuff
export GOPATH="$HOME/projects/go_lang"
export PATH="$PATH:$GOPATH/bin"

# enable pyenv shims and tab completion
if which pyenv >/dev/null; then
  eval "$(pyenv init -)"
fi

# enable tab completion for pipenv
if pipenv >/dev/null; then
    export PIPENV_VENV_IN_PROJECT=1
    eval "$(pipenv --completion)"
fi

# load rbenv automatically
if which rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi

# add identities to ssh-agent
ssh-add -K "$HOME/.ssh/github_dotcom_id_rsa" >& /dev/null
