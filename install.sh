#!/bin/bash

FILES="\
  .bashrc \
  .bash_profile \

  .zshrc \
  .zsh_profile \
  .zprofile \

  .shell \
  .profile \

  .editorconfig \

  .gitconfig \
  .gitignore \
"

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink configs
echo ""
echo "🔖  Symlinking configs:"
for FILE in $FILES
do
  [ -r "$DOTFILES/$FILE" ] && \
  [ -e "$DOTFILES/$FILE" ] && \
  ln -sfn "$DOTFILES/$FILE" "$HOME/$FILE"

  echo "   $DOTFILES/$FILE -> $HOME/$FILE ... Done"
done

# Source installed configs
if [[ -n $BASH_VERSION ]]; then
  source "$HOME/.bashrc"
elif [[ -n $ZSH_VERSION ]]; then
  source "$HOME/.zshrc"
fi
echo ""
echo "🌟  Loaded!"


# History file
touch $HISTFILE
echo ""
echo "📜  Makeing history file: $HISTFILE ... Done"


# .hushlogin (to get rid of "Last login...")
touch "$HOME/.hushlogin"
echo ""
echo "📋  Creating .hushlogin: $HOME/.hushlogin ... Done"


# All done
echo ""
echo "👊  All done!"
