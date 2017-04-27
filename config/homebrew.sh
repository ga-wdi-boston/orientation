#!/usr/bin/env bash
if [[ $# -eq 0 ]] ; then
  sudo chown -R $(whoami):admin /usr/local

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew doctor
fi

#pass update as arg once brew doctor issues resolved
if [[ $1 = "update" ]]; then
  brew update
  brew install tidy-html5
  brew install libsass
fi
