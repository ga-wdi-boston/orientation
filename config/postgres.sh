#!/usr/bin/env bash
if [[ $(uname -s) = 'Darwin' ]]; then
  brew install postgres

  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

  createdb `whoami`
else
  sudo apt-get install postgresql libpq-dev
  sudo -u postgres createuser `whoami` -s

  sudo -u postgres createdb `whoami`
fi

gem install pg

echo -e "\n Try typing 'psql' into console. Seek help from a
consultant if you receive any errors."
