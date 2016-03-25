# add my Bash scripts
export PATH="$PATH:$HOME/projects/bash_utils"

# Go requires this
export GOPATH="$HOME/projects/go_lang"
export PATH="$PATH:$GOPATH/bin"

# load rbenv automatically
eval "$(rbenv init -)"

export EDITOR="atom"

# make GitHub personal access token available for scripting
export GITHUB_TOKEN=$(security find-generic-password -s GITHUB_TOKEN -a patrickmckenna -w)
export GITHUBTEACHER_TOKEN=$(security find-generic-password -s GITHUBTEACHER_TOKEN -a githubteacher -w)
export GITHUBSTUDENT_TOKEN=$(security find-generic-password -s GITHUBSTUDENT_TOKEN -a githubstudent -w)
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -a patrickmckenna -w)

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
