#!/usr/bin/env bash
if [[ $# -eq 0 ]] ; then
  brew install nvm
  if [[ $(uname -s) != 'Darwin' ]]; then
    #LINUX
    mkdir -p ~/home/$(whoami)/.nvm
cat <<'EOF' >> ~/.bashrc

  export NVM_DIR="/home/$(whoami)/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

EOF

  else
    #MAC
    mkdir -p ~/.nvm
cat <<'EOF' >> ~/.bashrc

  export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh

EOF
  fi
fi

if [[ $1 = "node" ]]; then
  . "$NVM_DIR/nvm.sh" || . $(brew --prefix nvm)/nvm.sh
  nvm install --lts=boron || nvm install 6.9.4
  nvm alias default v6
  nvm use default
fi

echo -e "\nRestart your terminal"
