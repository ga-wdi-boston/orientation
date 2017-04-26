#!/usr/bin/env bash
git config --global color.ui true

echo -e "\n What is your Github username?"
read username
git config --global user.name "$username"

echo -e "\n What is your Github email address?"
read email
git config --global user.email "$email"

git config --global pull.rebase true
git config --global branch.autosetuprebase always
git config --global push.default simple
git config --global branch.autosetupmerge true
git config --global core.editor "atom --wait"
