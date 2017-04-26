#!/usr/bin/env bash
if which xcode-select; then
  echo 'xcode CLI tools already installed!'
else
  echo 'installing...'
  xcode-select --install
fi
