# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# git
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}
export PS1="\w \$(parse_git_branch)\$ "
export EDITOR='atom --wait'
export VISUAL='atom --wait'
