#!/usr/bin/env bash
if brew ls --versions git; then
  brew upgrade git
else
  brew install git
fi

if brew ls --versions hub; then
  brew upgrade hub
else
  brew install hub
fi

if [[ $(uname -s) = 'Darwin' ]]; then
  echo 'eval "$(hub alias -s)"' >> ~/.bashrc
fi
