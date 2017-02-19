# add my Bash scripts
export PATH="$PATH:$HOME/projects/bash_utils"

# Homebrew told me to do this
export PATH="$PATH:/usr/local/sbin"

# Go requires this
export GOPATH="$HOME/projects/go_lang"
export PATH="$PATH:$GOPATH/bin"

# load rbenv automatically
eval "$(rbenv init -)"

# enable pyenv shims, autocompletion
eval "$(pyenv init -)"
# do likewise for pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

export EDITOR="subl"

export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -a patrick -w)

# add identities to ssh-agent
ssh-add -K "$HOME/.ssh/id_github_dotcom" >&/dev/null
ssh-add -K "$HOME/.ssh/id_github_bastion" >&/dev/null

# bash completion for homebrew
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  . $(brew --prefix)/etc/bash_completion
fi

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

# execute commands in this file when starting interactive mode
export PYTHONSTARTUP="$HOME/projects/dotfiles/startup.py"
