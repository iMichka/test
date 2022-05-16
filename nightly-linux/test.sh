#!/bin/bash

export HOMEBREW_DEVELOPER=1
brew remove --force $(brew list --formula)
cd /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core
git remote add sjackman https://github.com/sjackman/homebrew-core
git fetch sjackman
git checkout glibc-2.13

brew install binutils -s

brew install hello
brew test hello
brew uninstall hello
brew install -s hello
brew test hello
