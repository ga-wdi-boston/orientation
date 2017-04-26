#!/usr/bin/env bash
if [[ $(uname -s) = 'Darwin' ]]; then
  xcode-select --install
fi
