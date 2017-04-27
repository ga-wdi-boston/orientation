#!/usr/bin/env bash
if which rvm; then
  read -r -p "Are you sure you would like to remove rvm? [y/n] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    rvm implode
  fi
fi

#brew install rbenv
if uname -s != 'Darwin'; then
  sudo apt-get install libffi-dev
fi

brew install rbenv

#add to .bashrc
cat <<'EOF' >> ~/.bashrc

# Rbenv
if which rbenv > /dev/null; then
   eval "$(rbenv init -)"
fi

EOF

source ~/.bashrc

rbenv rehash

if [[ $(uname -s) != 'Darwin' ]]; then
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
else
  brew install ruby-build
fi

if [[ $(rbenv --version) != 'rbenv 1.1.0' ]]; then
  echo -e "\n There may have been an issue installing rbenv. Please ask consultant for assistance. \n"
fi

#TODO prompt for destructive action
#this command just throws error
echo bundler > ~/.rbenv/default-gems

rbenv install 2.3.1
rbenv global 2.3.1

echo 'gem: --no-document' >> ~/.gemrc
