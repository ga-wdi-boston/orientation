#!/usr/bin/env bash
if uname -s = 'Darwin'; then
  touch ~/.bashrc

  touch ~/.bash_profile

  echo 'test -f ~/.bashrc && source ~/.bashrc' >> ~/.bash_profile

  cat ~/.bash_profile

  echo 'Checking ~/.bash_profile...'

  if grep -Fxq "test -f ~/.bashrc && source ~/.bashrc" ~/.bash_profile
  then
    echo "Looks good!"
  else
    echo "Oh No! It looks like there was an issue. Ask for assistance before continuing.
    Press [ENTER] to continue."
    read
  fi

  echo '/\/usr\/local\/bin/\nd\nwq' | sudo ed /etc/paths

  echo '1i\n/usr/local/bin\n.\nwq' | sudo ed /etc/paths
fi

cat /etc/paths
