#!/usr/bin/env bash
if uname -s != 'Darwin'; then
  export NVM_DIR="/home/$(whoami)/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
else
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

nvm install --lts=boron || nvm install 6.9.4
nvm alias default v6
nvm use default
