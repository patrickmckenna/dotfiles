# enable colorized terminal output
export CLICOLOR=1

# show current git branch in prompt
export PS1="\[\$(tput bold)\]\[\$(tput setaf 6)\]\w\[\$(tput setaf 3)\]\$(print-git-branch.sh)\[\$(tput setaf 6)\] > \[\$(tput sgr0)\]"

# general aliases
alias ll="ls -oAh"

# keep more history
export HISTSIZE=5000
export HISTFILESIZE=10000
shopt -s histappend


# Homebrew told me to do this
export PATH="$PATH:/usr/local/sbin"

# temp, for Airflow's 5.7
export PATH="$PATH:/usr/local/opt/mysql@5.7/bin"

# add my Bash scripts
export PATH="$PATH:$HOME/projects/bash_utils"

export EDITOR="subl"

export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -a $(whoami) -w)

# Hub uses this
export GITHUB_TOKEN=$(security find-generic-password -s HUB_TOKEN -a $(whoami) -w)

# Go requires this
export GOPATH="$HOME/projects/go_lang"
export PATH="$PATH:$GOPATH/bin"


# enable tab completion for Homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

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
ssh-add -K "$HOME/.ssh/github_bastion_id_rsa" >& /dev/null

export AWS_ACCESS_KEY_ID=$(security find-generic-password -s AWS_ACCESS_KEY_ID -a $(whoami) -w)
export AWS_SECRET_ACCESS_KEY=$(security find-generic-password -s AWS_SECRET_ACCESS_KEY -a $(whoami) -w)
export AWS_DEFAULT_REGION=$(security find-generic-password -s GITHUB_AWS_DEFAULT_REGION -a $(whoami) -w)
