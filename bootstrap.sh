#!/bin/bash

# Check if Homebrew is installed
if [ command -v brew >/dev/null 2>&1 ]; then
  echo "🚨  You don't have Homebrew installed. Please install it from http://brew.sh. Aborting."
  exit 1
else
  echo "🍻  Homebrew is installed."
fi

# Check if RVM is installed
if [ command -v rvm >/dev/null 2>&1 ]; then
  echo "🚨  You don't have RVM installed. Please install it from https://rvm.io. Aborting."
  exit 1
else
  echo "🍻  RVM is installed."
fi

# Check if NVM is installed
if [ command -v nvm >/dev/null 2>&1 ]; then
  echo "🚨  You don't have NVM installed. Please install it from https://github.com/creationix/nvm. Aborting."
  exit 1
else
  echo "🍻  NVM is installed."
fi

# Check if Atom is installed
if [ command -v atom >/dev/null 2>&1 ]; then
  echo "🚨  You don't have Atom shell commands installed. Please install it from https://atom.io and enable shell commands. Aborting."
  exit 1
else
  echo "🍻  Atom is installed."
fi

echo "===> ⌛️  Applying OSX settings..."
osx.sh

echo "===> ⌛️  Installing brew packages..."
brew.sh

echo "===> ⌛️  Installing cask apps..."
cask.sh

echo "===> ⌛️  Installing global npm packages..."
npm.sh

echo "===> ⌛️  Installing global ruby gems..."
rvm.sh

echo "===> ⌛️  Installing atom plugins..."
atom.sh

# Download git-completion.bash
if [ command -v curl >/dev/null 2>&1 ]; then
  echo "⚠️  You don't have curl installed. Git autocompleteons won't be enabled."
else
  echo "===> ⌛️  Downloading .git-completion.bash script..."
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

echo "===> ⌛️  Installing dotfiles..."
install.sh

echo "👊  All done."
