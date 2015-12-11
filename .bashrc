export PKG_CONFIG_PATH=$(brew --prefix python3)/Frameworks/Python.framework/Versions/3.4/lib/pkgconfig

# add RVM
export PATH="$PATH:$HOME/.rvm/bin"
# load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

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

# credentials for dummy "Acme Service" app to auth against GitHub API
export MOCK_EXTERNAL_SERVICE_CLIENT_ID=$(security find-generic-password -s mock_external_service_client_id -a patrickmckenna -w)
export MOCK_EXTERNAL_SERVICE_CLIENT_SECRET=$(security find-generic-password -s mock_external_service_client_secret -a patrickmckenna -w)

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
