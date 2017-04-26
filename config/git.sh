#!/usr/bin/env bash
if which git; then
  brew upgrade git
else
  brew install git
fi

cat <<'EOF' >> ~/.bashrc
# Git
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}
export PS1="\w \$(parse_git_branch)\n\$ "
export EDITOR='atom --wait'
export VISUAL='atom --wait'
EOF
