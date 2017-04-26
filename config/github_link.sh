#!/usr/bin/env bash

#TODO how to capture ssh-keygen output ????
#echo -e "\n What is you Github email address?"
#read email
# We can automate passphrase with -N ''
# still prompts for file even if file specified with -f flag
#ssh-keygen -t rsa -C "$email" -N '' -f "/Users/$USER/.ssh/id_rsa"

ssh-add ~/.ssh/id_rsa

if uname -s != 'Darwin'; then
  xclip -selection clipboard < ~/.ssh/id_rsa.pub
else
  pbcopy < ~/.ssh/id_rsa.pub
fi
