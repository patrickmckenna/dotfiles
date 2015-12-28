# add my Bash scripts
export PATH="$PATH:$HOME/projects/bash_utils"

# Go requires this
export GOPATH="$HOME/projects/go_lang"
export PATH="$PATH:$GOPATH/bin"

export EDITOR="sublime"

# make GitHub personal access token available for scripting
export GITHUB_TOKEN=$(security find-generic-password -s github_access_token -a patrickmckenna -w)
export GITHUBTEACHER_TOKEN=$(security find-generic-password -s githubteacher_access_token -a githubteacher -w)
export GITHUBSTUDENT_TOKEN=$(security find-generic-password -s githubstudent_access_token -a githubstudent -w)
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s homebrew_github_api_token -a patrickmckenna -w)


# bash completion for homebrew
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  . $(brew --prefix)/etc/bash_completion
fi

# enable colorized terminal output
export CLICOLOR=1

# show current git branch in prompt
export PS1="\w\[\033[36m\]\$(print-git-branch.sh) \[\033[00m\] > "

# general aliases
alias ll="ls -oAh"
