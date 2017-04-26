#!/usr/bin/env bash
if uname -s != 'Darwin'; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  PATH="$HOME/.linuxbrew/bin:$PATH"
  echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile
  sudo apt-get install build-essential curl git python-setuptools ruby
  brew install hub
else
  if brew ls --versions hub; then
    brew upgrade hub
  else
    brew install hub
  fi
  echo 'eval "$(hub alias -s)"' >> ~/.bashrc
fi
