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


# add my Bash scripts
export PATH="$PATH:$HOME/projects/bash_utils"


# Homebrew told me to do this
export PATH="$PATH:/usr/local/sbin"
# bash completion for homebrew
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then . $(brew --prefix)/etc/bash_completion; fi
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -a patrick -w)


# Go requires this
export GOPATH="$HOME/projects/go_lang"
export PATH="$PATH:$GOPATH/bin"


# load rbenv automatically
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# enable pyenv shims, autocompletion
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


export EDITOR="subl"


# Hub uses this
export GITHUB_TOKEN=$(security find-generic-password -s HUB_TOKEN -a patrick -w)


# add identities to ssh-agent
ssh-add -K "$HOME/.ssh/github_dotcom_id_rsa" >&/dev/null
ssh-add -K "$HOME/.ssh/github_bastion_id_rsa" >&/dev/null
